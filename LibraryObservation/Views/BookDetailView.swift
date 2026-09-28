//
//  BookDetailView.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Book image
                Image(systemName: book.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .foregroundStyle(.blue)

                // Book title
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Author
                VStack(alignment: .leading, spacing: 6) {
                    Text("Author")
                        .font(.headline)

                    Text(book.author)
                        .font(.title3)

                    Text(book.authorDetails)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Divider()

                // Book information
                VStack(alignment: .leading, spacing: 12) {
                    Text("Book Information")
                        .font(.headline)

                    HStack {
                        Label("Publication Year", systemImage: "calendar")
                        Spacer()
                        Text("\(book.publicationYear)")
                    }

                    HStack {
                        Label("Pages", systemImage: "book.pages")
                        Spacer()
                        Text("\(book.pageCount)")
                    }

                    HStack {
                        Label("Genre", systemImage: "tag")
                        Spacer()
                        Text(book.genre)
                    }
                }

                Divider()

                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)

                    Text(book.description)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BookDetailView(
            book: Book(
                title: "Moby-Dick",
                author: "Herman Melville",
                authorDetails: "AAmerican novelist, short story writer and poet.",
                publicationYear: 1851,
                pageCount: 635,
                imageName: "book.closed",
                genre: "Classic",
                description: "The obsessive quest of Captain Ahab for revenge on a giant white sperm whale."
            )
        )
    }
}
