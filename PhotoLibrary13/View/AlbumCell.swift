//
//  AlbumCell.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 08.02.2022.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    static let identifier = "cell"

    let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    let label: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = .black
        return label
    }()

    let count: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = .gray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [image, label, count])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 140),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }

    func configure (with cell: Album) {
        image.image = UIImage(named: cell.image)
        label.text = cell.label
        count.text = String(cell.count)
    }
}
