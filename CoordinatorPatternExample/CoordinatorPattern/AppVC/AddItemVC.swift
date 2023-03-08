//
//  AddItemVC.swift
//  CoordinatorPattern
//
//  Created by Birju Bhatt on 07/03/23.
//

import UIKit

class AddItemVC: UIViewController {
    var coordinator: AppCoordinator?
    var itemToEdit: Item?
    @IBOutlet weak var txtFldName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = (itemToEdit != nil) ? "Edit" : "Add"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonAction(_:)))
        // Do any additional setup after loading the view.
        txtFldName.text = itemToEdit?.name
        txtFldName.becomeFirstResponder()
    }
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        guard let name = txtFldName.text, !name.isEmpty else {return}
        
        if let itemToEdit = itemToEdit {
            let editedItem = Item(id: itemToEdit.id, name: name)
            coordinator?.didFinishEditingItem(editedItem)
        } else {
            let item = Item(id: UUID(), name: name)
            coordinator?.didFinishAddingItem(item)
        }
    }
}
