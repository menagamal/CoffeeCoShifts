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
        case addNewShifts(shifts: BehaviorRelay<[Shift]>)
    }
    
    var rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .addNewShifts(let shifts):
            return   addNewShiftsInstance(shifts)
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
    
    func addNewShiftsInstance(_ shifts: BehaviorRelay<[Shift]>)  -> UIViewController {
        return AddNewShiftBuilder().instantiate()
    }
}
