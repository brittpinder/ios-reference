//
//  CellAccessoryVC.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-07.
//

//
//  ViewController.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-07.
//

import UIKit

class CellAccessoryVC: UIViewController {

    var data = ["None", "Checkmark", "Detail Button", "Detail Disclosure Button", "Disclosure Indicator"]

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.pin(to: view)
    }
}

extension CellAccessoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]

        switch (indexPath.row) {
        case 1:
            cell.accessoryType = .checkmark
        case 2:
            cell.accessoryType = .detailButton
        case 3:
            cell.accessoryType = .detailDisclosureButton
        case 4:
            cell.accessoryType = .disclosureIndicator
        default:
            cell.accessoryType = .none
        }

        return cell
    }
}
