//
//  TabBarView.swift
//  TabViewAnimation
//
//  Created by Basel Baragabah on 10/02/2022.
//

import SwiftUI

struct TabBarView <Content : View> : View {
    var content : Content
    var tabItems : [TabItem]

    init(tabItems : [TabItem], @ViewBuilder content: () -> Content) {
        self.tabItems = tabItems
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {

            content
            
            TabBar(tabItems: tabItems)
       
        }    
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(tabItems: []) {}
    }
}
