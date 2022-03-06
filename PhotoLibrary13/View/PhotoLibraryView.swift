//
//  PhotoLibraryView.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 18.01.2022.
//

import UIKit

class PhotoLibraryView: UIViewController {

    let addBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: nil, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment ) -> NSCollectionLayoutSection? in
            let section = self.albums[sectionIndex]
            switch section.type {
                case .singleRow:
                    return self.createSingleRowCell()

                case .doubleRow:
                    return self.createDoubleRowCell()

                case .text:
                    return self.createTextCell(layoutEnvironment: layoutEnvironment)
            }
        }

        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.id)
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.id)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.id)

        collectionView.dataSource = self

        view.addSubview(collectionView)

        navigationItem.leftBarButtonItem = addBarButton
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.width - 32), heightDimension: .absolute(40))
        //.absolute(360), heightDimension: .absolute(40))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }

    func createTextCell(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.list(using: .init(appearance: .plain), layoutEnvironment: layoutEnvironment)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [createSectionHeader()]

        return section
    }

    func createDoubleRowCell() -> NSCollectionLayoutSection {
        let imageWidth = (self.view.frame.width - 22) / 2
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(imageWidth), heightDimension: .absolute(imageWidth))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(imageWidth), heightDimension: .absolute(imageWidth * 2 + 10)),
            subitems: [item, item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [createSectionHeader()]

        return section
    }

    func createSingleRowCell() -> NSCollectionLayoutSection {
        let imageWidth = (self.view.frame.width - 22) / 2
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(imageWidth), heightDimension: .absolute(imageWidth))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(imageWidth), heightDimension: .absolute(imageWidth + 10)),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [createSectionHeader()]

        return section
    }
}

extension PhotoLibraryView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return albums.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums[section].albums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let album = albums[indexPath.section].albums[indexPath.row]
        switch album.type {
            case .preview:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.id, for: indexPath) as! AlbumCell
                cell.configure(with: album)
                return cell
            case .text:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.id, for: indexPath) as! TextCell
                cell.configure(with: album)
                return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = albums[indexPath.section]
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.id, for: indexPath) as! SectionHeader
        header.configure(with: section)
        return header
    }

}
