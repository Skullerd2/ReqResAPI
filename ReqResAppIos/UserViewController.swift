//
//  UserViewController.swift
//  ReqResAppIos
//
//  Created by Vadim on 24.07.2024.
//

import UIKit
import Kingfisher
class UserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    private let networkManager = NetworkManager.shared
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeUser(user)
    }
    
    private func composeUser(_ user: User){
        nameLabel.text = "\(user.firstName) \(user.lastName)"
//        networkManager.fetchAvatar(from: user.avatar) { [weak self] imageData in
//            self?.avatarImageView.image = UIImage(data: imageData)
//        }
        avatarImageView.kf.setImage(with: user.avatar)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
