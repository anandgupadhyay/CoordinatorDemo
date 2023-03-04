//
//  Coordinator.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 02/03/23.
//

import Foundation
import UIKit

public protocol Coordinator : class {

    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)

    func start()
}
