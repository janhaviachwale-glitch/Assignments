//
//  LibraryObservationApp.swift
//  LibraryObservation
//
//  Created by Janhavi Achwale on 28/09/26.
//

import SwiftUI

@main
struct LibraryObservationApp: App {

    @State private var library = Library()

    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environment(library)
        }
    }
}
