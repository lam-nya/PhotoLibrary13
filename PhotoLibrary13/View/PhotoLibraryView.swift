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
        layout.sectionInset = UIEdgeInsets (top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)

        let myCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        myCollectionView.backgroundColor = .red

        myCollectionView.dataSource = self

        view.addSubview(myCollectionView)

        view.backgroundColor = .cyan
        navigationItem.leftBarButtonItem = addBarButton
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true

    }

}

extension PhotoLibraryView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }

}
