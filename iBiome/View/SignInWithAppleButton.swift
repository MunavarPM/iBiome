//
//  SignInWithAppleButton.swift
//  iBiome
//
//  Created by MUNAVAR PM on 23/09/23.
//

import SwiftUI
import AuthenticationServices


struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
    
}
