//
//  SearchReposTableViewController+Extensions.swift
//  GitHubExplorer
//
//  Created by mhmohamed on 7/11/19.
//  Copyright © 2019 mark. All rights reserved.
//

import Foundation
import UIKit

extension SearchReposViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }else{
            return searchReposViewModel?.currentCount ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingTableViewCell", for: indexPath) as! LoadingTableViewCell
            if self.searchReposViewModel?.isFetchInProgress ?? false{
                cell.indicatorView.isHidden = false
                cell.indicatorView.startAnimating()
            }else{
                cell.indicatorView.isHidden = true
                cell.indicatorView.stopAnimating()
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
            if let repo = searchReposViewModel?.repo(at: indexPath.row) {
                cell.configure(model: repo)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    //    func isLoadingCell(for indexPath: IndexPath) -> Bool {
    //        return indexPath.row >= searchReposViewModel?.currentCount ?? 0
    //    }
    //
    //    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
    //        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
    //        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
    //        print(indexPathsIntersection)
    //        return Array(indexPathsIntersection)
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > (contentHeight - scrollView.frame.height) {
            if !(self.searchReposViewModel?.isFetchInProgress ?? false)  {
                //self.searchReposViewModel?.isFetchInProgress  = true
                let loadingIndexPath = IndexPath(row: 0, section: 1)
                self.tableView.reloadRows(at: [loadingIndexPath], with: .none)
                self.searchReposViewModel?.fetchRepos(keyword: self.searchfield.text ?? "")
            }
        }
    }
}
extension SearchReposViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchReposViewModel?.fetchRepos(keyword: textField.text ?? "")
        return false
    }
}

extension SearchReposViewController: SearchReposViewModelDelegate {
    
    func onFetchCompleted(with newIndexPathsToInsert: [IndexPath]?) {
        
        //        guard let newIndexPathsToInsert = newIndexPathsToInsert else {
        //
        //            return
        //        }
        //        tableView.beginUpdates()
        //        tableView.insertRows(at: newIndexPathsToInsert, with: .none)
        //        tableView.endUpdates()
        
        tableView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        print("error fetching data")
    }
}
