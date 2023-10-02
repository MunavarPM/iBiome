//
//  OnBoardingView.swift
//  iBiome
//
//  Created by MUNAVAR PM on 24/09/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var showSignup = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("OnBoardingBG")
                    .ignoresSafeArea()
                VStack {
                    Image(.screenshot)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom)
                    
                    
                        NavigationLink(destination: SignupView()) {
                            Text("Let's Start")
                                .frame(width: 150, height: 15)
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                        }
                        .navigationBarBackButtonHidden(true)
                }
                
            }
        }
        
    }
}

#Preview {
    OnBoardingView()
}
