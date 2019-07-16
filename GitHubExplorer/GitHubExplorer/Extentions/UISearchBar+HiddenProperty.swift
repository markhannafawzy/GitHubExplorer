//
//  UIBarButtonItem+HiddenProperty.swift
//  MarvelApp
//
//  Created by msaad on 1/22/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
import UIKit
public extension UISearchBar {
    
    public func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
}
