//
//  BeerDetailView.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/26.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import SwiftUI

struct BeerDetailView: View {
    
    let beer: Beer
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("ABV:")
                text(beer.abv, unit: "%")
            }
            HStack {
                Text("IBU:")
                text(beer.ibu, unit: "")
            }
            Text(beer.description)
            Text(beer.contributedBy)
            Spacer()
        }
        .navigationBarTitle(beer.name)
    }
    
    private func text(_ value: Double?, unit: String) -> some View {
        if let value = value {
            return Text(String(value) + unit)
        } else {
            return Text("??" + unit)
        }
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
