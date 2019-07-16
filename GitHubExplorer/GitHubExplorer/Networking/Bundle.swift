//
//  Bundle.swift
//  MarvelApp
//
//  Created by msaad on 1/31/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
extension Bundle {
    var targetName:String? {return infoDictionary?["CFBundleName"] as? String }
}
