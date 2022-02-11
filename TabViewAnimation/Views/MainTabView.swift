//
//  MainTabView.swift
//  TabViewAnimation
//
//  Created by Basel Baragabah on 10/02/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @SceneStorage("selectedTab") private var selectedTab: Tab = .first
    
   private var tabItems = [
        TabItem(id: 0, text: "Home", icon: "home", tab: .first),
        TabItem(id: 1, text: "Profile", icon: "user", tab: .second),
    ]
    
    var body: some View {
        
        NavigationView {
        
            TabBarView(tabItems: tabItems) {
            
                switch selectedTab {
                case .first:
                    HomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                case .second:
                    ProfileView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                }
            
         
        }
        .navigationTitle("Test")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
