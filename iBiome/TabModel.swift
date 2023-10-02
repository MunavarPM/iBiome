//
//  TabModel.swift
//  iBiome
//
//  Created by MUNAVAR PM on 26/09/23.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(icon: "house", color: .teal, selection: .home),
    TabItem(icon: "cart", color: .green, selection: .explore),
    TabItem(icon: "heart", color: .red, selection: .notifications),
    TabItem(icon: "person.2.badge.gearshape", color: .pink, selection: .library)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
}
