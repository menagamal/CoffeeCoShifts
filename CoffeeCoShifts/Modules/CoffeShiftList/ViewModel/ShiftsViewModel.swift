//
//  ShiftsViewModel.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation
import RxSwift
import RxCocoa

class ShiftsViewModel {
    
    var shifts: BehaviorRelay<[Shift]> = BehaviorRelay(value: [Shift]())
    
    private var coordinator: ShiftsCoordinator
    
    init(coordinator: ShiftsCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchShifts()  {
        if let url = Bundle.main.url(forResource: "shifts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result = try JSONDecoder().decode(ShiftsResponse.self, from: data)
                if let shifts = result.shifts {
                    self.shifts.accept(shifts)
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    func addNewShiftPressed() {
        coordinator.navigate(to: .addNewShifts(completation: { newShift in
            var currentVals = self.shifts.value
            currentVals.append(newShift)
            self.shifts.accept(currentVals)
        }))
    }
    
}
