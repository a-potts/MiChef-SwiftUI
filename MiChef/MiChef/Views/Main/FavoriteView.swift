//
//  FavoriteView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            Text("Favorites")
                .navigationTitle("No Favorites Added")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
