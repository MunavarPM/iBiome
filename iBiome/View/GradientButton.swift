//
//  GradientButton.swift
//  iBiome
//
//  Created by MUNAVAR PM on 22/09/23.
//

import SwiftUI

struct GradientButton: View {
    
    @State private var angle: Double = 0
    
    var gradient1: [Color] = [
        Color(red: 30/255, green: 225/255, blue: 30/255),
        Color(red: 4/255, green: 228/255, blue: 186/255),
        Color(red: 120/255, green: 120/255, blue: 215/255),
        Color(red: 203/255, green: 194/255, blue: 245/255),
    ]
    
    var buttonTitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        NavigationStack {
            Button {
                buttonAction()
            } label: {
                GeometryReader() { geametry in
                    ZStack {
                        AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(angle))
                            .blendMode(.overlay)
                            .blur(radius: 11)
                            .mask {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(height: 50)
                                    .frame(minWidth: geametry.size.width - 16)
                                    .blur(radius: 8)
                            }
                            .onAppear() {
                                withAnimation(.linear(duration: 11)) {
                                    self.angle += 350
                                }
                            }
                        GradientTextView(text: buttonTitle)
                            .font(.headline)
                            .frame(width: geametry.size.width - 16)
                            .frame(height: 50)
                            .background(Color("OnBoardingBG"))
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
}
