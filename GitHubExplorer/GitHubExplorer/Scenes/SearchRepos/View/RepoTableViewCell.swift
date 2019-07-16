//
//  RepoTableViewCell.swift
//  GitHubExplorer
//
//  Created by mhmohamed on 7/15/19.
//  Copyright © 2019 mark. All rights reserved.
//

import UIKit
import Kingfisher
class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var userAvatar: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(model: .none)
    }
    
    func configure(model: Repo?) {
        
        if  let model = model,
            let owner = model.owner,
            let avatarUrl = model.owner?.avatar_url,
            let ownerName = owner.login {
            userName.text = ownerName
            let url = URL(string: avatarUrl)
            let placeHolderImage = UIImage(named: "placeHolder")
            if let url = url{
                let processor = RoundCornerImageProcessor(cornerRadius: self.userAvatar.frame.height / 2)
                KingfisherManager.shared.retrieveImage(with: url, options: [.processor(processor)], progressBlock: nil, completionHandler: { [weak self] image, error, cacheType, imageURL in
                    self?.userAvatar.setImage(image, for: .normal)
                })
            }
        }
        
        repoName.text = model?.full_name
        
    }
}
