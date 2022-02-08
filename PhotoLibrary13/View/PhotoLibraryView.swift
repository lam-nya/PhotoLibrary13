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

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets (top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 140, height: 170)
        layout.scrollDirection = .horizontal


        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: "cell")

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumCell
        cell.configure(with: album)
        return cell
    }
}
