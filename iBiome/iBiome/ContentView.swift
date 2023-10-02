//
//  ContentView.swift
//  iBiome
//
//  Created by MUNAVAR PM on 22/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Image(.SIGINBG_4)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sing up")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(.white)
                    Text("Quality speak the Brand Name")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.7))
                    HStack(spacing: 12) {
                        Image(systemName: "envelope.open.fill")
                            .foregroundStyle(.white)
                        TextField("Email", text: $email)
                            .colorScheme(.dark)
                            .foregroundStyle(.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                    }
                    .frame(height: 52)
                    .background(Color("SecondaryBG").cornerRadius(16).opacity(0.2))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(1.0))
                            .blendMode(.overlay)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "key.fill")
                            .foregroundStyle(.white)
                        SecureField ("Password", text: $password)
                            .colorScheme(.dark)
                            .foregroundStyle(.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.password)
                    }
                    .frame(height: 52)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(1.0))
                            .blendMode(.overlay)
                    }
                    .background(Color("SecondaryBG").cornerRadius(16).opacity(0.2))
                    
                    GradientButton()
                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    VStack(alignment: .leading, spacing: 16) {
                        Button {
                            
                        } label: {
                            HStack(spacing: 4) {
                                Text("Already have an account?")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                GradientTextView(text: "Sign in")
                                    .font(.footnote).bold()
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.5))
                    .background(Color("SecondaryBG").opacity(0.1))
                    .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                    .shadow(color: Color("SecondaryBG").opacity(0.9 ), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30)
            .padding(.horizontal)
        }
    }
}
#Preview {
    ContentView()
}
