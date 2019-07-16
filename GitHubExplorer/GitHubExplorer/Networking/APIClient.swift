//
//  MarvelAPIClient.swift
//  MarvelApp
//
//  Created by msaad on 1/23/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
final class APIClient {

    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetch<ResponseType: Decodable>(with request: Request, completion: @escaping (Result<(ResponseType,[Int]?), DataResponseError>) -> Void) {

        let urlRequest = URLRequest(url: request.url)
        let parameters = request.parameters
        let encodedURLRequest = urlRequest.encode(with: parameters)
        
        session.dataTask(with: encodedURLRequest, completionHandler: { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data
                else {
                    completion(Result.failure(DataResponseError.network))
                    return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(ResponseType.self, from: data) else {
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            var pages: [Int]?
            if let linkHeader = httpResponse.allHeaderFields["Link"] as? String {
                pages = self.getPagesFromHeader(linkHeader: linkHeader)
            }
            completion(Result.success((decodedResponse,pages)))
        }).resume()
        
    }
    
    func getPagesFromHeader(linkHeader: String) -> [Int] {
        let indicesOfGreaterThanSign = linkHeader.indicesOf(string: ">")
        var returnedPages = [Int]()
        for i in indicesOfGreaterThanSign {
            var start = i - 1
            let end = i
            var range = start..<end
            var stringNumber = linkHeader[range]
            var convertedNumber: Int?
            while let number = Int(stringNumber) {
                start = start - 1
                range = start..<end
                stringNumber = linkHeader[range]
                convertedNumber = number
            }
            returnedPages.append(convertedNumber ?? 0)
        }
        return returnedPages
    }
}
extension String {
    func indicesOf(string: String) -> [Int] {
        var indices = [Int]()
        var searchStartIndex = self.startIndex
        
        while searchStartIndex < self.endIndex,
            let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
            !range.isEmpty
        {
            let index = distance(from: self.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }
        
        return indices
    }
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
