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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShiftsBuilder().instantiate(viewController: self)

        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Coffee Co Shifts"
        shiftsTableView.register(UINib(nibName: "ShiftTableViewCell", bundle: nil), forCellReuseIdentifier: "ShiftTableViewCell")

        BindUI()
        viewModel?.fetchShifts()
    }
    
    func BindUI() {
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

}

