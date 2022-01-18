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
        view.backgroundColor = .cyan
        navigationItem.leftBarButtonItem = addBarButton
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
