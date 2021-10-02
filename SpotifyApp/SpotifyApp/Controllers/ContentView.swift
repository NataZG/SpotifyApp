//
//  ContentView.swift
//  SpotifyApp
//
//  Created by Nata on 02.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
            SearchBar()
              EmptyStateView()
            }
            .navigationBarTitle("Music Search")
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: 85))
                .padding(.bottom)
            Text("Start searching for music...")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemGreen))
    }
}

struct SearchBar: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Type a song, artist, or album name..."
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator()
    }
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
