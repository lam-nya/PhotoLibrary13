//
//  SectionHeader.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 09.02.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {

    static let id = "cellHeader"

    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var divider: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

//        let headerStackView = UIStackView(arrangedSubviews: [divider, stackView])
//        headerStackView.translatesAutoresizingMaskIntoConstraints = false
//        headerStackView.axis = .vertical
//        addSubview(headerStackView)
//        addSubview(stackView)
        addSubview(label)
        addSubview(button)
        addSubview(divider)

        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            divider.topAnchor.constraint(equalTo: topAnchor, constant: -1),
            divider.heightAnchor.constraint(equalToConstant: 1),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 10)


//            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            headerStackView.topAnchor.constraint(equalTo: topAnchor),
//            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            stackView.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: -1),
//            divider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder)")
    }

    func configure(with section: AlbumSection) {
        label.text = section.label
        if section.button != nil {
            button.isHidden = false
            button.setTitle(section.button, for: .normal)
        } else {
            button.isHidden = true
        }
//        if section.type == .text {
//            divider.isHidden = true
//        }
    }
}
