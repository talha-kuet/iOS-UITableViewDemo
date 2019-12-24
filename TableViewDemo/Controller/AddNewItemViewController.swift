//
//  AddNewItemViewController.swift
//  TableViewDemo
//
//  Created by Mazegeek Mac Mini 2018 on 10/25/19.
//  Copyright © 2019 MazeGeek. All rights reserved.
//

import UIKit

protocol AddNewItemViewControllerDelegate: class {
    func getName(text: String)
}

class AddNewItemViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK:- Properties
    var titleText = ""
    weak var delegate: AddNewItemViewControllerDelegate!
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = titleText
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed(_:)))
        
        setupTextField()
    }
    
    //MARK:- Setup UI
    private func setupTextField() {
        
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.becomeFirstResponder()
    }
    
    //MARK:- Button Actions
    @objc func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        nameTextField.resignFirstResponder()
        
        dismiss(animated: true) {
            self.delegate.getName(text: self.nameTextField.text ?? "")
        }
    }
    
    @objc func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

extension AddNewItemViewController: AddNewItemViewControllerDelegate {
    func getName(text: String) {
        
    }
}

