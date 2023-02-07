//
//  ViewController.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-07.
//

import UIKit

class BasicTableViewController: UIViewController {

    var data = ["Apples", "Bananas", "Oranges", "Carrots", "Kale"]

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

extension BasicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
