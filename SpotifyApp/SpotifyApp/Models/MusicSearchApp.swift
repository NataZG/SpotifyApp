//
//  Music_SearchApp.swift
//  SpotifyApp
//
//  Created by Nata on 02.10.2021.
//

import SwiftUI

struct MusicSearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SongListViewModel())
        }
    }
}
