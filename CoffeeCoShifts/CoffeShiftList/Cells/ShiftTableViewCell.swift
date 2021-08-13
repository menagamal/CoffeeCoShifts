//
//  ShiftTableViewCell.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import UIKit

class ShiftTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var coloredView: UIView!
    
  
    
    func configure(with shift:Shift)  {
        labelTitle.text = "\(shift.name ?? "") (\(shift.role ?? ""))"
        coloredView.backgroundColor =  UIColor().named(shift.color ?? "")
        
        coloredView.layer.cornerRadius = coloredView.frame.size.width/2
        coloredView.clipsToBounds = true
        
        
    }
}
