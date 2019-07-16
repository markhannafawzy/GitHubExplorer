//
//  LoadingTableViewCell.swift
//  GitHubExplorer
//
//  Created by mhmohamed on 7/16/19.
//  Copyright © 2019 mark. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
