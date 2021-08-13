//
//  AddNewShiftViewController.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import UIKit
import RxCocoa
import RxSwift

class AddNewShiftViewController: UIViewController {

    var saveShiftButton: UIBarButtonItem?

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var employeePicker: UIPickerView!
    @IBOutlet weak var rolePicker: UIPickerView!
    @IBOutlet weak var colorPicker: UIPickerView!
    
    var viewModel: AddShiftViewModel?
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        BindUI()
    }

    func setupViews()  {
        saveShiftButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNewShiftAction))
        self.navigationItem.rightBarButtonItem  = saveShiftButton
        startDatePicker.minimumDate = Date()
        
        viewModel?.setEmployee(index: 0)
        viewModel?.setRole(index: 0)
        viewModel?.setColor(index: 0)
        viewModel?.setStartDate(date: startDatePicker.date)
        viewModel?.setEndDate(date: endDatePicker.date)
    }
    
    @objc private func saveNewShiftAction() {
        viewModel?.save()
    }
    
    func BindUI() {
        guard let viewModel = viewModel else {
            return
        }
        viewModel.employeeDataSource.bind(to: employeePicker.rx.itemTitles) { (row, element) in
            return element
        }
        .disposed(by: disposeBag)
        
        employeePicker.rx.itemSelected
            .subscribe { [weak self](event) in
                switch event {
                case .next(let selected):
                    self?.viewModel?.setEmployee(index: selected.row)
                default:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.roleDataSource.bind(to: rolePicker.rx.itemTitles) { (row, element) in
            return element
        }
        .disposed(by: disposeBag)
        
        rolePicker.rx.itemSelected
            .subscribe { [weak self] (event) in
                switch event {
                case .next(let selected):
                    self?.viewModel?.setRole(index: selected.row)
                default:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.colorDataSource.bind(to: colorPicker.rx.itemTitles) { (row, element) in
            return element
        }
        .disposed(by: disposeBag)
        
        colorPicker.rx.itemSelected
            .subscribe { [weak self](event) in
                switch event {
                case .next(let selected):
                    self?.viewModel?.setColor(index: selected.row)
                default:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        startDatePicker.rx.date.subscribe{ [weak self] (event) in
            switch event {
            case .next(let selected):
                self?.endDatePicker.minimumDate = selected
            default:
                break
            }
        }
        .disposed(by: disposeBag)
        
        startDatePicker.rx.date.subscribe{ [weak self] (event) in
            switch event {
            case .next(let selected):
                self?.viewModel?.setStartDate(date: selected)
                break
            default:
                break
            }
        }
        .disposed(by: disposeBag)
        
        endDatePicker.rx.date.subscribe{ [weak self] (event) in
            switch event {
            case .next(let selected):
                self?.viewModel?.setEndDate(date: selected)
                break
            default:
                break
            }
        }
        .disposed(by: disposeBag)
    }
}
