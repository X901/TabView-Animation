//
//  TabBarItem.swift
//  TabViewAnimation
//
//  Created by Basel Baragabah on 10/02/2022.
//

import Foundation

struct TabItem: Identifiable {
    var id : Int
    var text: String
    var icon: String
    var tab: Tab
}


enum Tab: Int {
    case first
    case second
}

