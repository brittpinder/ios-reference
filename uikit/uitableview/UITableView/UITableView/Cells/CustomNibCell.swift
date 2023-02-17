//
//  CustomNibCell.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-17.
//

import UIKit

class CustomNibCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    static let nibName = "CustomNibCell" // Must match the class name
    static let nibIdentifier = "CustomNibCellIdentifier"

    func set(category: Category) {
        icon.image = category.image
        titleLabel.text = category.title
    }
}
