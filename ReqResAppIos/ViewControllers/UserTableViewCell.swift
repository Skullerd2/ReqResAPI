//
//  UserTableViewCell.swift
//  ReqResAppIos
//
//  Created by Vadim on 24.07.2024.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet{
            avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 5
        }
    }
    
    func configure(with user: User){
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        if user.avatar != nil{
            avatarImageView.kf.setImage(with: user.avatar)
        } else{
            avatarImageView.image = UIImage(systemName: "person.crop.circle")
        }
    }

}
