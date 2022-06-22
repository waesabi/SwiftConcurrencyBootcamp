//
//  Actors.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Sanket Kumar on 21/06/22.
//

import SwiftUI

struct HomeView: View {
	
	var body: some View {
		ZStack {
			Color.gray.opacity(0.5).ignoresSafeArea()
		}
	}
}

struct BrowseView: View {
	
	var body: some View {
		ZStack {
			Color.yellow.opacity(0.8).ignoresSafeArea()
		}
	}
}

struct Actors: View {
    var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house.fill")
				}
			
			BrowseView()
				.tabItem {
					Label("Browse", systemImage: "magnifyingglass")
				}
		}
    }
}

struct Actors_Previews: PreviewProvider {
    static var previews: some View {
        Actors()
    }
}
