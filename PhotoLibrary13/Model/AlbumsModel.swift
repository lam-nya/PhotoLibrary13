//
//  SinglePreviewElementModel.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 18.01.2022.
//

enum AlbumType {
    case preview
    case text
}

struct Album {
    let image: String
    let label: String
    let count: Int
    let type: AlbumType
}

enum SectionType {
    case doubleRow
    case singleRow
    case text
}

struct AlbumSection {
    let type: SectionType
    let label: String
    let button: String?
    let albums: [Album]
}

extension PhotoLibraryView {
    var albums: [AlbumSection] {
        let albums = [
            AlbumSection(type: .doubleRow, label: "My albums", button: "All", albums:
                [Album(image: "anime-girl", label: "Anime girls", count: 214, type: .preview),
                 Album(image: "mech", label: "Mechs", count: 100, type: .preview),
                 Album(image: "skyscraper", label: "Skyscrapers", count: 10, type: .preview),
                 Album(image: "flower", label: "Flowers", count: 99, type: .preview),
                 Album(image: "people", label: "People", count: 54, type: .preview),
                 Album(image: "rainbow", label: "Rainbows", count: 6, type: .preview),
                 Album(image: "mlp", label: "My Little Pony", count: 137, type: .preview),
                 Album(image: "landscape", label: "Landscapes", count: 18, type: .preview)
                ]),
            AlbumSection(type: .singleRow, label: "Faces and places", button: nil, albums:
                [Album(image: "anime-girl", label: "Anime girls", count: 214, type: .preview),
                 Album(image: "mech", label: "Mechs", count: 100, type: .preview),
                 Album(image: "skyscraper", label: "Skyscrapers", count: 10, type: .preview),
                 Album(image: "flower", label: "Flowers", count: 99, type: .preview)
                ]),
            AlbumSection(type: .text, label: "Mediafiles by type", button: nil, albums:
                [Album(image: "video", label: "Video", count: 214, type: .text),
                 Album(image: "person.crop.rectangle", label: "Selphie", count: 100, type: .text),
                 Album(image: "livephoto", label: "Live Photos", count: 10, type: .text),
                 Album(image: "pano", label: "Panoramas", count: 99, type: .text)
                ]),
            AlbumSection(type: .text, label: "Others", button: nil, albums:
                [Album(image: "square.and.arrow.down", label: "Imported", count: 214, type: .text),
                 Album(image: "eye.slash", label: "Hidden", count: 100, type: .text),
                 Album(image: "trash", label: "Recently deleted", count: 10, type: .text)
                ])
        ]
        return albums
    }
}
