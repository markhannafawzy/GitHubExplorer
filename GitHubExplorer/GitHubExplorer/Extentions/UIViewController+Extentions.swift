//
//  UIViewController+Extentions.swift
//  MarvelApp
//
//  Created by msaad on 2/3/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        }
        else {
            return self
        }
    }
}
