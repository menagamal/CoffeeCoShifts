//
//  AddNewShiftBuilder.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation
import UIKit

class AddNewShiftBuilder {
    func instantiate() -> AddNewShiftViewController {
        let vc: AddNewShiftViewController = UIViewController.instanceXib()
        return vc 
    }
}
