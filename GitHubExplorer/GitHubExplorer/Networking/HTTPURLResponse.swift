//
//  HTTPURLResponse.swift
//  MarvelApp
//
//  Created by msaad on 1/23/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}
