//
//  SinglePreviewElementModel.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 18.01.2022.
//

struct Album {
    let image: String
    let label: String
    let count: Int
}

extension PhotoLibraryView {
    var albums: [[Album]] {
        let albums = [
            [Album(image: "anime-girl", label: "Anime girls", count: 214),
             Album(image: "mech", label: "Mechs", count: 100),
             Album(image: "skyscraper", label: "Skyscrapers", count: 10),
             Album(image: "flower", label: "Flowers", count: 99),
             Album(image: "people", label: "People", count: 54),
             Album(image: "rainbow", label: "Rainbows", count: 6),
             Album(image: "mlp", label: "My Little Pony", count: 137),
             Album(image: "landscape", label: "Landscapes", count: 18)
            ],
            [Album(image: "anime-girl", label: "Anime girls", count: 214),
             Album(image: "mech", label: "Mechs", count: 100),
             Album(image: "skyscraper", label: "Skyscrapers", count: 10),
             Album(image: "flower", label: "Flowers", count: 99)
            ],
            [Album(image: "video", label: "Video", count: 214),
             Album(image: "person.crop.rectangle", label: "Selphie", count: 100),
             Album(image: "livephoto", label: "Live Photos", count: 10),
             Album(image: "pano", label: "Panoramas", count: 99)
            ],
            [Album(image: "square.and.arrow.down", label: "Imported", count: 214),
             Album(image: "eye.slash", label: "Hidden", count: 100),
             Album(image: "trash", label: "Recently deleted", count: 10)
            ]
        ]
        return albums
    }
}
