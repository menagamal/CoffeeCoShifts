//
//  AddNewShiftViewController.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import UIKit

class AddNewShiftViewController: UIViewController {
    var saveShiftButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        saveShiftButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNewShiftAction))
        self.navigationItem.rightBarButtonItem  = saveShiftButton
        
    }

    @objc private func saveNewShiftAction() {
     
    }
}
