//
//  AddShiftViewModel.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation
import RxCocoa
import RxSwift

class AddShiftViewModel {
    var employeeDataSource: BehaviorRelay<[String]> = BehaviorRelay(value:["Anna","Anton","Eugene","Keyvan"])
    var roleDataSource: BehaviorRelay<[String]> = BehaviorRelay(value:["Front of House","Cook","Waiter","Prep"])
    var colorDataSource: BehaviorRelay<[String]> = BehaviorRelay(value:["red","green","blue"])
    
    private(set) var newShift = PublishSubject<Shift>()
    
    private var selectedStartDate: Date?
    private var selectedEndDate: Date?
    private var selectedEmployee: String?
    private var selectedRole: String?
    private var selectedColor: String?
    
    
    func setStartDate(date:Date) {
        selectedStartDate = date
    }
    
    func setEndDate(date:Date) {
        selectedEndDate = date
    }
    
    func setEmployee(index: Int)  {
        selectedEmployee = employeeDataSource.value[index]
    }
    
    func setColor(index: Int)  {
        selectedColor = colorDataSource.value[index]
    }
    
    func setRole(index: Int)  {
        selectedRole = roleDataSource.value[index]
    }
    
    func save()  {
        guard let startDate = selectedStartDate,
              let endDate = selectedEndDate,
              let employee = selectedEmployee,
              let role = selectedRole,
              let color = selectedColor else {
                return
        }
        newShift.onNext(Shift(role: role, name: employee, start_date: "sss", end_date: "ss", color: color))
        
    }
    
}
