//
//  AddEditBookView.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import SwiftUI

struct AddEditBookView: View {
    @Environment(Library.self) private var library

    let book: Book?

    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var authorDetails = ""
    @State private var publicationYear = ""
    @State private var pageCount = ""
    @State private var genre = ""
    @State private var description = ""

    private var isEditing: Bool {
        book != nil
    }

    var body: some View {
        @Bindable var library = library

        Form {
            Section("Book Information") {
                TextField("Title", text: $title)

                TextField("Author", text: $author)

                TextField("Author Details", text: $authorDetails)

                TextField("Publication Year", text: $publicationYear)
                    .keyboardType(.numberPad)

                TextField("Page Count", text: $pageCount)
                    .keyboardType(.numberPad)

                TextField("Genre", text: $genre)

                TextField("Description", text: $description, axis: .vertical)
                    .lineLimit(3...6)
            }

            Section {
                Button(isEditing ? "Update Book" : "Add Book") {
                    saveBook()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(isEditing ? "Edit Book" : "Add Book")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadBook()
        }
    }

    private func loadBook() {
        guard let book else {
            return
        }

        title = book.title
        author = book.author
        authorDetails = book.authorDetails
        publicationYear = String(book.publicationYear)
        pageCount = String(book.pageCount)
        genre = book.genre
        description = book.description
    }

    private func saveBook() {
        guard let publicationYear = Int(publicationYear),
              let pageCount = Int(pageCount),
              !title.isEmpty,
              !author.isEmpty else {
            return
        }

        if let book {
            let updatedBook = Book(
                id: book.id,
                title: title,
                author: author,
                authorDetails: authorDetails,
                publicationYear: publicationYear,
                pageCount: pageCount,
                imageName: book.imageName,
                genre: genre,
                description: description
            )

            library.updateBook(updatedBook)
        } else {
            let newBook = Book(
                title: title,
                author: author,
                authorDetails: authorDetails,
                publicationYear: publicationYear,
                pageCount: pageCount,
                imageName: "book.closed",
                genre: genre,
                description: description
            )

            library.addBook(newBook)
        }

        dismiss()
    }
}

#Preview {
    NavigationStack {
        AddEditBookView(book: nil)
            .environment(Library())
    }
}
