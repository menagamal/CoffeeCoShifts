//
//  BaseCoordinator.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//
import Foundation
import UIKit

protocol BaseCoordinator {
    associatedtype Destination
    var rootViewController: UIViewController { get set }
    func makeViewController(for destination: Destination) -> UIViewController
}
