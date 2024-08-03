//
//  NewUserViewController.swift
//  ReqResAppIos
//
//  Created by Vadim on 27.07.2024.
//

import UIKit

final class NewUserViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var delegate: NewUserViewControllerDelegate?
    
    private let networkManager = NetworkManager.shared

    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let user = User(id: 0, firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", avatar:  nil)
        self.delegate?.createUser(user: user)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}


