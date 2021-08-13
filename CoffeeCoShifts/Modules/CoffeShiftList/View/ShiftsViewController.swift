//
//  ViewController.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import UIKit
import RxCocoa
import RxSwift

class ShiftsViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var shiftsTableView: UITableView!
    
    var viewModel: ShiftsViewModel?
    var disposeBag = DisposeBag()

    var addNewShiftButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShiftsBuilder().instantiate(viewController: self)
        setupPage()
        BindUI()
        viewModel?.fetchShifts()
    }
    
    private func setupPage() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Coffee Co Shifts"
        
        addNewShiftButton = UIBarButtonItem(title: "Add Shift", style: .plain, target: self, action: #selector(addNewShift))
        self.navigationItem.rightBarButtonItem  = addNewShiftButton
        
        registerTable()
    }
    
    private func registerTable() {
        shiftsTableView.register(UINib(nibName: "ShiftTableViewCell", bundle: nil), forCellReuseIdentifier: "ShiftTableViewCell")
    }
    
    private func BindUI() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.shifts.asObservable()
            .bind(to: shiftsTableView.rx
                .items(cellIdentifier: "ShiftTableViewCell", cellType: ShiftTableViewCell.self))
            { _, shift, cell in
                cell.configure(with: shift)
               
        }.disposed(by: disposeBag)
            
    }
    
    @objc private func addNewShift() {
        viewModel?.addNewShiftPressed()
    }

}

