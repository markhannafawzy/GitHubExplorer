//
//  SearchReposViewModel.swift
//  GitHubExplorer
//
//  Created by mhmohamed on 7/11/19.
//  Copyright © 2019 mark. All rights reserved.
//

import Foundation
protocol SearchReposViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

class SearchReposViewModel {
    private weak var delegate: SearchReposViewModelDelegate?
    
    private var repos: [Repo] = []
    private var currentPage = 0
    var isFetchInProgress = false
    
    let client = APIClient()
    var request: Request?
    
    init(delegate: SearchReposViewModelDelegate) {
        
//        self.request = Request(path: Constants.searchPath, parameters: Constants.apiKey.merging(Constants.baseAuthParameters, uniquingKeysWith: +))
//        self.request = Request(path: Constants.searchPath, parameters:[:])
        self.delegate = delegate
    }
    
    var currentCount: Int {
        return repos.count
    }
    
    func repo(at index: Int) -> Repo? {
        return repos[index]
    }
    
    func fetchRepos(keyword: String) {
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        self.request = Request(path: Constants.searchPath, parameters:["q":keyword , "page": "\(currentPage)"])
        client.fetch(with: request ?? Request(path: Constants.searchPath, parameters: [:])) {[weak self] (result:Result<(BaseResponse,[Int]?),DataResponseError>) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.isFetchInProgress = false
                    self?.delegate?.onFetchFailed(with: error.reason)
                }
            case .success(let response):
                DispatchQueue.main.async {
                    self?.currentPage += 1
                    self?.isFetchInProgress = false
                    self?.repos.append(contentsOf: response.0.repos ?? [])
                    let currentPage = response.1?[0] ?? 1
                    let totalPages = response.1?[1] ?? 1
                    if (currentPage < totalPages) {
                        if currentPage > 1 {
                            let indexPathsToInsert = self?.calculateIndexPathsToInsert(from: (response.0.repos)!)
                            self?.delegate?.onFetchCompleted(with: indexPathsToInsert)
                        } else {
                            self?.delegate?.onFetchCompleted(with: .none)
                        }
                    } else {
                        self?.delegate?.onFetchCompleted(with: .none)
                    }
                }
            }
        }
    }
    private func calculateIndexPathsToInsert(from newRepos: [Repo]) -> [IndexPath] {
        let startIndex = repos.count - newRepos.count
        let endIndex = startIndex + newRepos.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
