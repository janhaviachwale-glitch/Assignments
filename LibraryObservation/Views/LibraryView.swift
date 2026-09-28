//
//  LibraryView.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import SwiftUI

struct LibraryView: View {
    @Environment(Library.self) private var library

    @State private var showingAddBook = false
    @State private var bookToEdit: Book?

    var body: some View {
        @Bindable var library = library

        NavigationStack {
            List {
                Section("Library") {
                    TextField(
                        "Library Name",
                        text: $library.libraryName
                    )
                }
                
                Section("Books") {
                    ForEach(library.books) { book in
                        HStack {
                            NavigationLink {
                                BookDetailView(book: book)
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(book.title)
                                        .font(.headline)
                                    
                                    Text(book.author)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    
                                    Text("Published: \(book.publicationYear)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            
                            Spacer()

                            Button {
                                bookToEdit = book
                            } label: {
                                Image(systemName: "pencil")
                            }
                            .buttonStyle(.borderless)
                            .accessibilityLabel("Edit \(book.title)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let book = library.books[index]
                            library.deleteBook(book)
                        }
                    }
                }
            }
            .navigationTitle(library.libraryName)
            .navigationDestination(item: $bookToEdit) { book in
                AddEditBookView(book: book)
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        showingAddBook = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add Book")

                    NavigationLink {
                        PropertyTrackingView()
                    } label: {
                        Image(systemName: "eye")
                    }
                    .accessibilityLabel("Observation Demo")
                }
            }
            .sheet(isPresented: $showingAddBook) {
                NavigationStack {
                    AddEditBookView(book: nil)
                }
            }
        }
    }
}

#Preview {
    LibraryView()
        .environment(Library())
}
