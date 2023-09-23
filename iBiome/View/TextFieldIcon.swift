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
        Color.init(red: 101/255, green: 134/255, blue: 1),
        Color.init(red: 1, green: 64/255, blue: 80/255),
        Color.init(red: 109/255, green: 1, blue: 185/255),
        Color.init(red: 39/255, green: 232/255, blue: 1),
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
                
                Color("TertiaryBG")
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
