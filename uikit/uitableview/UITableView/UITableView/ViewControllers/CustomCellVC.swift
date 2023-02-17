//
//  CustomCellVC.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-17.
//

import UIKit

class CustomCellVC: UIViewController {

    var data = [Category(image: UIImage(systemName:"pawprint"), title: "Pets"),
                Category(image: UIImage(systemName:"leaf"), title: "Nature"),
                Category(image: UIImage(systemName:"cloud.sun"), title: "Weather")]

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
        //tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.register(UINib(nibName: CustomNibCell.nibName, bundle: nil), forCellReuseIdentifier: CustomNibCell.nibIdentifier)
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.pin(to: view)
    }
}

extension CustomCellVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomNibCell.nibIdentifier, for: indexPath) as! CustomNibCell
        cell.set(category: data[indexPath.row])
        return cell
    }
}
