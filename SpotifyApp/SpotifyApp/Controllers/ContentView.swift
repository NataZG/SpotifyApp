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
        .foregroundColor(Color(.systemIndigo))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
