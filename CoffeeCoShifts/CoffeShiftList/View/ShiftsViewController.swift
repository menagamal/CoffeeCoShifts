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
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Coffee Co Shifts"
    }
    
    func BindUI() {
        shiftsTableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
    }

}

