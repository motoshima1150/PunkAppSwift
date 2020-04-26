//
//  ContentView.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/13.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: BeerListViewModel
    
    var body: some View {
        NavigationView {
            list(of: viewModel.beers)
        }
        .onAppear {
            self.viewModel.onAppear()
        }
    }
    
    private func list(of beers: [Beer]) -> some View {
        List(beers) { beer in
            BeerListItemView(beer: beer)
        }
        
    }
}

struct BeerListItemView: View {
    let beer: Beer
    
    var body: some View {
        VStack {
            Text(beer.name)
            Text(beer.description)
            Text(beer.contributedBy)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BeerListViewModel())
    }
}
