//
//  NewUserViewController.swift
//  ReqResAppIos
//
//  Created by Vadim on 27.07.2024.
//

import UIKit

class NewUserViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var delegate: NewUserViewControllerDelegate?
    
    private let networkManager = NetworkManager.shared

    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let user = User(id: 0, firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", avatar:  nil)
        post(user: user)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

// MARK: - Networking
extension NewUserViewController{
    private func post(user: User) {
        networkManager.postUser(user) { result in
            switch result {
            case .success(let postUserQuery):
                print("\(postUserQuery) created")
                self.delegate?.createUser(user: User(postUserQuery: postUserQuery))
            case .failure(let error):
                print("Error in post user: \(error)")
            }
        }
    }
}
