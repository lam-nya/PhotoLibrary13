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

            let layout = UICollectionViewCompositionalLayout { (sectionIndex, _ ) -> NSCollectionLayoutSection? in
                let section = self.albums[sectionIndex]
                switch section.type {
                    case .singleRow:
                        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width - 20) / 2), heightDimension: .absolute(180))

                        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                        let group = NSCollectionLayoutGroup.horizontal(
                            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width - 20) / 2), heightDimension: .absolute(180)),
                            subitems: [item]
                        )

                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                        section.orthogonalScrollingBehavior = .groupPaging
                        return section

                    case .doubleRow:
                        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width - 20) / 2), heightDimension: .absolute(180))

                        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                        let group = NSCollectionLayoutGroup.vertical(
                            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width - 20) / 2), heightDimension: .absolute(360)),
                            subitems: [item, item]
                        )

                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                        section.orthogonalScrollingBehavior = .groupPaging
                        return section

                    case .text:
                        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.width - 20), heightDimension: .absolute(40))

                        let item = NSCollectionLayoutItem(layoutSize: itemSize)

                        let group = NSCollectionLayoutGroup.vertical(
                            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.width - 20), heightDimension: .absolute(40)),
                            subitems: [item]
                        )

                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
                        return section
                }
            }

        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.identifier)

        collectionView.dataSource = self

        view.addSubview(collectionView)

        navigationItem.leftBarButtonItem = addBarButton
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
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
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as! AlbumCell
                cell.configure(with: album)
                return cell
            case .text:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as! TextCell
                cell.configure(with: album)
                return cell
        }

    }
}
