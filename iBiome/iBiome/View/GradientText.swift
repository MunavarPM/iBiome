//
//  GradientText.swift
//  iBiome
//
//  Created by MUNAVAR PM on 22/09/23.
//

import SwiftUI


struct GradientTextView: View {
    var text: String = "Text Name"
    var body: some View {
        Text(text)
            .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
    }
}


extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
