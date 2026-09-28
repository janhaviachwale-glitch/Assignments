//
//  Book.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: UUID
    var title: String
    var author: String
    var authorDetails: String
    var publicationYear: Int
    var pageCount: Int
    var imageName: String
    var genre: String
    var description: String

    init(
        id: UUID = UUID(),
        title: String,
        author: String,
        authorDetails: String,
        publicationYear: Int,
        pageCount: Int,
        imageName: String,
        genre: String,
        description: String
    ) {
        self.id = id
        self.title = title
        self.author = author
        self.authorDetails = authorDetails
        self.publicationYear = publicationYear
        self.pageCount = pageCount
        self.imageName = imageName
        self.genre = genre
        self.description = description
    }
}
