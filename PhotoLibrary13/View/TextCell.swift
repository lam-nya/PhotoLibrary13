//
//  TextCell.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 08.02.2022.
//

import UIKit

class TextCell: UICollectionViewCell {
    static let identifier = "cellText"

    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .blue
        return image
    }()

    let label: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = .blue
        return label
    }()

    let count: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = .gray
        return label
    }()

    let arrow: UIImageView = {
        let image = UIImageView()
        image.tintColor = .gray
        image.image = UIImage(systemName: "chevron.forward")
        return image
    }()

    let divider: UIView = {
        let divider = UIView()
        return divider
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [image, label, count, arrow])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.setCustomSpacing(10, after: image)
        stackView.setCustomSpacing(5, after: count)
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 18),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            arrow.widthAnchor.constraint(equalToConstant: 8),
            arrow.heightAnchor.constraint(equalToConstant: 14),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder)")
    }

    func configure (with cell: Album) {
        image.image = UIImage(systemName: cell.image)
        label.text = cell.label
        count.text = String(cell.count)
    }
}
