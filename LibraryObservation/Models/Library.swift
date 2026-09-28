//
//  Library.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import Foundation
import Observation

@Observable
final class Library {

    var books: [Book] = [
        Book(
            title: "Moby-Dick",
            author: "Herman Melville",
            authorDetails: "AAmerican novelist, short story writer and poet.",
            publicationYear: 1851,
            pageCount: 635,
            imageName: "book.closed",
            genre: "Classic",
            description: "The obsessive quest of Captain Ahab for revenge on a giant white sperm whale."
        ),

        Book(
            title: "To Kill a Mockingbird",
            author: "Harper Lee",
            authorDetails: "American novelist known for her influential literary work.",
            publicationYear: 1960,
            pageCount: 281,
            imageName: "book.closed",
            genre: "Fiction",
            description: "A novel exploring justice, morality, and compassion."
        ),

        Book(
            title: "1984",
            author: "George Orwell",
            authorDetails: "English novelist and essayist known for his political fiction.",
            publicationYear: 1949,
            pageCount: 328,
            imageName: "book.closed",
            genre: "Dystopian",
            description: "A dystopian novel about surveillance, control and freedom."
        )
    ]

    var libraryName: String = "My Library"

    var lastUpdated: Date = Date()

    @ObservationIgnored
    var debugMessage: String = "Internal library debugging information"

    func addBook(_ book: Book) {
        books.append(book)
        lastUpdated = Date()
    }

    func updateBook(_ book: Book) {
        guard let index = books.firstIndex(where: { $0.id == book.id }) else {
            return
        }

        books[index] = book
        lastUpdated = Date()
    }

    func deleteBook(_ book: Book) {
        books.removeAll { $0.id == book.id }
        lastUpdated = Date()
    }
    
    func trackLibraryNameChanges() {
        withObservationTracking {
            print("Currently tracking library name: \(libraryName)")
        } onChange: {
            print("Library name changed")
        }
    }
}
