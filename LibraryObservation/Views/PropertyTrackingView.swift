//
//  PropertyTrackingView.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import SwiftUI

struct PropertyTrackingView: View {
    @Environment(Library.self) private var library

    var body: some View {
        VStack(spacing: 20) {
            Text("Property-Level Observation")
                .font(.title2)
                .fontWeight(.bold)

            Text("This view reads only selected Library properties.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            GroupBox("Observed Properties") {
                VStack(spacing: 12) {
                    Text("Library Name")
                        .font(.headline)

                    Text(library.libraryName)
                        .font(.title3)

                    Divider()

                    Text("Book Count")
                        .font(.headline)

                    Text("\(library.books.count)")
                        .font(.title3)
                }
                .padding(.vertical)
            }

            GroupBox("Not Read By This View") {
                VStack(spacing: 8) {
                    Text("lastUpdated")
                    Text("debugMessage")
                }
                .foregroundStyle(.secondary)
            }
            
            Button("Start Manual Tracking") {
                library.trackLibraryNameChanges()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Observation")
    }
}

#Preview {
    NavigationStack {
        PropertyTrackingView()
            .environment(Library())
    }
}
