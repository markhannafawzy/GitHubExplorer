//
//  Request.swift
//  MarvelApp
//
//  Created by msaad on 1/31/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
class Request
{
    
    private var path: String {
        get{
            return url.absoluteString.replacingOccurrences(of: Constants.baseURL, with: "")
        }
        set(newValue){
            if let url = URL(string: "\(initURL(path: newValue))"){
                self.url = url
            }
        }
    }
    var url: URL
    var parameters:Parameters

    //MARK:- Intializer
    init(path: String ,parameters: Parameters) {
        
        self.url = (URL(string: Constants.baseURL))!
        self.parameters = parameters
        self.path = path
    }
    
    private func initURL(path : String)->String {
        return Constants.baseURL.appending(path)
    }
}
