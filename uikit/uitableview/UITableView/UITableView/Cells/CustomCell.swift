//
//  CustomCell.swift
//  UITableView
//
//  Created by Brittany Pinder on 2023-02-17.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"

    let icon = UIImageView()
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell() {
        addSubview(icon)
        addSubview(titleLabel)

        icon.contentMode = .scaleAspectFit
        titleLabel.font = .systemFont(ofSize: 18)

        icon.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.widthAnchor.constraint(equalToConstant: 25),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20)
        ])
    }

    func set(category: Category) {
        icon.image = category.image
        titleLabel.text = category.title
    }
}
