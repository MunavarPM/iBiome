//
//  TextFieldIcon.swift
//  iBiome
//
//  Created by MUNAVAR PM on 23/09/23.
//

import SwiftUI

struct TextFieldIcon: View {
    
    var iconName: String
    @State private var colorAngle: Double = 0.0
    @Binding var currentlyEditing: Bool
    
    var gradient1: [Color] = [
        Color(red: 30/255, green: 225/255, blue: 30/255),
        Color(red: 4/255, green: 228/255, blue: 186/255),
        Color(red: 120/255, green: 120/255, blue: 215/255),
        Color(red: 203/255, green: 194/255, blue: 245/255),
    ]

    
    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .dark) {
                
                if currentlyEditing { /// Background gradient while use click.!
                    AngularGradient(gradient: Gradient(colors: gradient1), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, angle: .degrees(colorAngle))
                        .blur(radius: 10)
                        .onAppear() {
                            withAnimation(.linear(duration: 7)) {
                                self.colorAngle += 350
                            }
                        }
                }
                
                Color("OnBoardingBG")
                    .cornerRadius(12)
                    .opacity(0.8)
                    .blur(radius: 3)
            }
        }
        .cornerRadius(12)
        .overlay {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 1)
                    .blendMode(.overlay)
                Image(systemName: iconName)
                    .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
                    .font(.system(size: 17, weight: .medium))
            }
        }
        .frame(width: 36, height: 36)
        .padding([.vertical, .leading], 8)
    }
}

#Preview {
    TextFieldIcon(iconName: "key.fill", currentlyEditing: .constant(true))
}
