//
//  GradientButton.swift
//  iBiome
//
//  Created by MUNAVAR PM on 22/09/23.
//

import SwiftUI

struct GradientButton: View {
    var buttonTitle: String
    var buttonAction: () -> Void
    var gradient1: [Color] = [
        Color.init(red: 101/255, green: 134/255, blue: 1),
        Color.init(red: 1, green: 64/255, blue: 80/255),
        Color.init(red: 109/255, green: 1, blue: 185/255),
        Color.init(red: 39/255, green: 232/255, blue: 1),
    ]
     
    @State private var angle: Double = 0
    
    var body: some View {
        Button {
            
        } label: {
            GeometryReader() { geametry in
                ZStack {
                    AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(0))
                        .blendMode(.overlay)
                        .blur(radius: 11)
                        .mask {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .frame(minWidth: geametry.size.width - 16)
                                .blur(radius: 8)
                        }
                    GradientTextView(text: "Sign Up")
                        .font(.headline)
                        .frame(width: geametry.size.width - 16)
                        .frame(height: 50)
                        .background(Color("TertiaryBG"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                                .blendMode(.normal)
                                .opacity(0.7)
                        )
                        .cornerRadius(16)
                }
            }
            .frame(height: 50)
        }
    }
}
