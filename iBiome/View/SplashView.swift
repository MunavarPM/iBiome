//
//  SplashView.swift
//  iBiome
//
//  Created by MUNAVAR PM on 24/09/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct SplashView: View {
    
    @State var animaationFinished: Bool = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            ZStack {
                if animaationFinished {
                    OnBoardingView()
                } else {
                    AnimatedImage(url: getURL())
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 11.67) {
                withAnimation(.easeInOut(duration: 0.7)) {
                    animaationFinished = true
                }
            }
        }
    }
    
    func getURL() -> URL {
        let bundle = Bundle.main.path(forResource: "Splash", ofType: "gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        return url
    }
}

#Preview {
    SplashView()
}
