//
//  String+Extentions.swift
//  MarvelApp
//
//  Created by msaad on 1/23/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}
