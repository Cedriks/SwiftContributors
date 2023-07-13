//
//  ContributorCollectionViewCell.swift
//  SwiftContributors
//
//  Created by Cedrik on 13/07/2023.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(label)
        label.textAlignment = .center
    }

    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with item: Contributor) {
        label.text = item.login
        label.textColor = .yellow
    }
}

