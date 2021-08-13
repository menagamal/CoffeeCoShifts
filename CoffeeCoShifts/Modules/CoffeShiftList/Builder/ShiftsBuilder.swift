//
//  ShiftsBuilder.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation

class ShiftsBuilder {
    func instantiate(viewController: ShiftsViewController){
        let coordinator = ShiftsCoordinator(rootViewController: viewController)
        viewController.viewModel = ShiftsViewModel(coordinator: coordinator)
    }
}
