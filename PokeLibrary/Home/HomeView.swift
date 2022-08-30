//
//  HomeView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

extension HomeView {
    // Here all the published object or things that will change will be here so that we can write better test later
    // @MainActor is basically responsible for updating our UI instead of actual HomeViewModel class which makes the viewModel reused other places
    @MainActor class ViewModel: ObservableObject {
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
