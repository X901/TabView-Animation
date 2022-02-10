//
//  HomeView.swift
//  TabViewAnimation
//
//  Created by Basel Baragabah on 09/02/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
        ForEach((1...100).reversed(), id: \.self) {
            Text("\($0)…")
                .foregroundColor(.red)
        }
        }
        .listStyle(.plain)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
