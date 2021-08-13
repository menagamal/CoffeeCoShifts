//
//  ShiftsCoordinator.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation
import UIKit
import RxCocoa

class ShiftsCoordinator: BaseCoordinator {
    
    enum Destination {
        case addNewShifts(completation: NewShiftCompletationAdded)
    }
    
    var rootViewController: UIViewController
    
    var formBuilder = AddNewShiftBuilder()
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .addNewShifts(let completation):
            return   addNewShiftsInstance(completation: completation)
        }
    }
    func navigate(to destination: ShiftsCoordinator.Destination) {
        let viewController = makeViewController(for: destination)
        rootViewController.show(viewController, sender: rootViewController)
    }
    
    func present(to destination: ShiftsCoordinator.Destination) {
        let viewController = makeViewController(for: destination)
        rootViewController.present(viewController, animated: true)
    }
    
}
private extension ShiftsCoordinator {
    
    func addNewShiftsInstance(completation: @escaping NewShiftCompletationAdded)  -> UIViewController {
        return formBuilder.instantiate(completation: completation)
    }
}
