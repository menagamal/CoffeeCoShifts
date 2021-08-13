//
//  ShiftsBuilder.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation

class ShiftsBuilder {
    func instantiate(viewController: ShiftsViewController){
        viewController.viewModel = ShiftsViewModel()
    }
}
