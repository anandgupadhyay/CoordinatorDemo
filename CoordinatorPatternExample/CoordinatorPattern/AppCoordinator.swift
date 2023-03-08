//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Anand Upadhyay on 07/03/23.
//  Copyright © 2023 Anand. All rights reserved.
//

import UIKit

class AppCoordinator {
    var items = [Item]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = ItemListVC.instantiate(from: .Main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func addItem() {
        let vc = AddItemVC.instantiate(from: .Main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func didFinishAddingItem(_ item: Item) {
        items.append(item)
        navigationController.popViewController(animated: true)
    }
    func editItem(_ item: Item) {
        let vc = AddItemVC.instantiate(from: .Main)
        vc.coordinator = self
        vc.itemToEdit = item
        navigationController.pushViewController(vc, animated: true)
    }
    func didFinishEditingItem(_ item: Item) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item
        }
        navigationController.popViewController(animated: true)
    }
}
