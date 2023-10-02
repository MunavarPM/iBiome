//
//  ContentView.swift
//  iBiome
//
//  Created by MUNAVAR PM on 22/09/23.
//

import SwiftUI
import AudioToolbox

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editingEmailTextField: Bool = false
    @State private var editingPasswordTextField: Bool = false
    @State private var emailIconBounce: Bool = false
    @State private var passwordIconBounce: Bool = false
    @State private var signupToggle: Bool = true
    @State private var rotationEffect: Double = 0.0
    @State private var showAlert: Bool = false
    @State private var alertTittle: String = ""
    @State private var alertMessage: String = ""
    @State private var signinToggle: Bool = false
    
    private let generator = UISelectionFeedbackGenerator() /// For activating the field
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(signupToggle ? .akash : .abstractWallpaper)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(signupToggle ? "Sing up" : "Sign in")
                            .font(Font.largeTitle.bold())
                            .foregroundStyle(.white)
                        Text("Quality speak the Brand Name")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.7))
                        HStack(spacing: 12) {
                            TextFieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextField)
                                .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                            TextField("Email", text: $email) { isEditing in
                                editingEmailTextField = isEditing
                                editingPasswordTextField = false
                                generator.selectionChanged()
                                if isEditing {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                        emailIconBounce.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                            emailIconBounce.toggle()
                                        }
                                    }
                                }
                            }
                            .colorScheme(.dark)
                            .foregroundStyle(.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                        }
                        .frame(height: 52)
                        .background(Color("OnBoardingBG").cornerRadius(16)
                            .opacity(0.2))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(1.0))
                                .blendMode(.overlay)
                        }
                        HStack(spacing: 12) {
                            TextFieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordTextField)
                                .scaleEffect(passwordIconBounce ? 1.2 : 1.0)
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
                        .background(Color("OnBoardingBG").cornerRadius(16).opacity(0.2))
                        .onTapGesture {
                            editingPasswordTextField = true
                            editingEmailTextField = false
                            generator.selectionChanged()
                            if editingPasswordTextField {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                    passwordIconBounce.toggle()
                                    print("Bounce up done✨")
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                        passwordIconBounce.toggle()
                                        print("Bounce back Done🚀")
                                    }
                                }
                            }
                        }
                        NavigationLink(destination: HomeView(), isActive: $signinToggle) {
                                EmptyView()
                        }
                        .hidden()
                        GradientButton(buttonTitle: signupToggle ? "Create Account" : "Sign in") {
                            generator.selectionChanged()
                            signinToggle = true
                        }
                        
                        
                        
                        if signupToggle {
                            Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                                .font(.footnote)
                                .foregroundColor(Color.white.opacity(0.7))
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.white.opacity(0.1))
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Button {
                                withAnimation(.easeInOut(duration: 0.7)){
                                    signupToggle.toggle()
                                    self.rotationEffect += 180
                                }
                            } label: {
                                HStack(spacing: 4) {
                                    Text(signupToggle ? "Already have an account?" : "Don't have any acount")
                                        .font(.footnote)
                                        .foregroundColor(Color.white.opacity(0.7))
                                    GradientTextView(text: signupToggle ? "Sign in" : "Sign up")
                                        .font(.footnote)
                                        .bold()
                                }
                            }
                        }
                        if !signupToggle {
                            Button {
                                
                            } label: {
                                HStack(spacing :4) {
                                    Text("Forgot Password")
                                        .font(.footnote)
                                        .foregroundStyle(.white).opacity(0.7)
                                    GradientTextView(text: "Reset Password")
                                        .font(.footnote).bold()
                                    
                                }
                            }
                            Button {
                                
                            } label: {
                                SignInWithAppleButton()
                                    .frame(height: 50)
                                    .cornerRadius(16)
                            }
                            
                        }
                    }
                    .padding(20)
                }
                .rotation3DEffect(Angle(degrees: rotationEffect), axis: (x: 0.0, y: 5.0, z: 0.0))
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.5))
                        .background(Color("OnBoardingBG")
                            .opacity(0.1))
                        .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                        .shadow(color: Color("OnBoardingBG").opacity(0.9 ), radius: 60, x: 0, y: 30)
                )
                .rotation3DEffect(Angle(degrees: rotationEffect), axis: (x: 0.0, y: 2.0, z: 0.0))
                .cornerRadius(30)
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTittle), message: Text(alertMessage), dismissButton: .cancel())
                }
            }
        }
    }
}
#Preview {
    SignupView()
}
