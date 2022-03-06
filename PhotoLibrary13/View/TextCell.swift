//
//  TextCell.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 08.02.2022.
//

import UIKit

class TextCell: UICollectionViewListCell {

    static let id = "cellText"

    func configure (with cell: Album) {
        var cellConfig = self.defaultContentConfiguration()
        cellConfig.prefersSideBySideTextAndSecondaryText = true

        cellConfig.image = UIImage(systemName: cell.image)
        cellConfig.imageProperties.tintColor = .blue

        cellConfig.text = cell.label
        cellConfig.textProperties.font = .systemFont(ofSize: 14)
        cellConfig.textProperties.color = .blue

        cellConfig.secondaryText = String(cell.count)
        cellConfig.secondaryTextProperties.font = .systemFont(ofSize: 14)
        cellConfig.secondaryTextProperties.color = .gray

        self.contentConfiguration = cellConfig

        let arrow = UICellAccessory.OutlineDisclosureOptions(style: .cell, tintColor: .gray)
        let accessorry = UICellAccessory.outlineDisclosure(options: arrow)
        self.accessories = [accessorry]
    }
}
