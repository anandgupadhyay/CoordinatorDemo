//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Birju Bhatt on 07/03/23.
//

import UIKit

class ItemListVC: UIViewController {

    @IBOutlet weak var tblViewItemList: UITableView!
    
    var coordinator: AppCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonAction(_:)))
        self.tblViewItemList.removeHeaderSectionPaddingForiOS15()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tblViewItemList.reloadData()
    }
    @objc func rightButtonAction(_ sender: UIBarButtonItem) {
        coordinator?.addItem()
    }
}
extension ItemListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.setEmptyMessageIfRequired((coordinator?.items.isEmpty)!)
        return (coordinator?.items.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell
        cell?.lblItemName.text = coordinator?.items[indexPath.row].name
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = coordinator?.items[indexPath.row]
        coordinator?.editItem(item!)
    }
}
extension UITableView {
    fileprivate func configureLabel(_ message: String) {
        let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        noDataLabel.text          = message
        noDataLabel.numberOfLines = 0
        noDataLabel.textColor     = UIColor.black
        noDataLabel.font          = UIFont(name: "System", size: 17.0)
        noDataLabel.textAlignment = .center
        self.backgroundView       = noDataLabel
        self.separatorStyle       = .none
    }
    
    func setEmptyMessageIfRequired(message:String? = "No item found", _ isEmpty: Bool) {
        if isEmpty {
            configureLabel(message ?? "No item found")
        }
        else {
            restore()
        }
    }

    func restore() {
        self.backgroundView = nil
    }
    func removeHeaderSectionPaddingForiOS15() {
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
    }
}
