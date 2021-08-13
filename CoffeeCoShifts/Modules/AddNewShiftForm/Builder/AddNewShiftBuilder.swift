//
//  AddNewShiftBuilder.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

typealias NewShiftCompletationAdded = (Shift) -> Void


class AddNewShiftBuilder {
    
    var disposeBag = DisposeBag()
    func instantiate(completation: @escaping NewShiftCompletationAdded) -> AddNewShiftViewController {
        let vc: AddNewShiftViewController = UIViewController.instanceXib()
        let viewModel = AddShiftViewModel()
        vc.viewModel = viewModel
        viewModel.newShift.subscribe{ (event) in
            switch event {
            case .next(let newShift):
                completation(newShift)
                DispatchQueue.main.async {
                    vc.navigationController?.popViewController(animated: true)
                }
            default:
                break
            }
        }.disposed(by: disposeBag)
        
        return vc 
    }
}
