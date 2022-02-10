//
//  TabBar.swift
//  TabViewAnimation
//
//  Created by Basel Baragabah on 09/02/2022.
//

import SwiftUI

struct TabBar: View {
    
    @SceneStorage("selectedTab") private var selectedTab: Tab = .first
    var tabItems : [TabItem]
    
    var body: some View {
        
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 0
            
            
        HStack {
            
            tapButtons
            
        }
        .padding(.bottom, hasHomeIndicator ? 16 : 0)
        .frame(maxWidth: .infinity, maxHeight: hasHomeIndicator ? 88 : 49)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        
    }
    }
    
    var tapButtons: some View {
        ForEach(tabItems) { item in
            Button {
                selectedTab = item.tab
            } label: {
                VStack(spacing: 0) {
                    LottieButton(filename: item.icon, loopMode: .playOnce, isPlaying: .constant(selectedTab == item.tab))
                        .frame(width: 44, height: 29)
                    
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundColor(selectedTab == item.tab ? Color("sanmarino") : .secondary)
            
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(tabItems: [])
    }
}


