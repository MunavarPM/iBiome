//
//  HomeView.swift
//  iBiome
//
//  Created by MUNAVAR PM on 23/09/23.
//

import SwiftUI

struct HomeView: View {
    private let categories = ["iPhone", "Mac", "iPad", "Watch", "Vision", "AirPods", "Store"]
    @State private var search: String = ""
    @State private var emailIconBounce: Bool = false
    @State private var editingEmailTextField: Bool = false
    @State private var selectedCategory: String?
    
    private let generator = UISelectionFeedbackGenerator()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("OnBoardingBG")
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        TagLineView()
                            .padding()
                        
                        HStack {
                            HStack(spacing: 12) {
                                TextFieldIcon(iconName: "magnifyingglass", currentlyEditing: $editingEmailTextField)
                                    .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                                TextField("Search", text: $search) { isEditing in
                                    editingEmailTextField = isEditing
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
                            Button {
                                print("sort")
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .fill(Color("OnBoardingBG"))
                                        .cornerRadius(10)
                                        .frame(width: 45, height: 45)
//                                        .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
                                        .overlay {
                                            VStack(alignment: .center, spacing: 7) {
                                                HStack(spacing: -0.8) {
                                                    Circle()
                                                        .frame(width: 9, height: 9)
                                                        .offset(x: 0)
                                                    Rectangle()
                                                        .frame(width: 15, height: 5)
                                                        .offset(x: 5)
                                                        .opacity(0.5)
                                                }
                                                HStack(spacing: -0.8) {
                                                    Rectangle()
                                                        .frame(width: 15, height: 5)
                                                        .offset(x: 0)
                                                        .opacity(0.5)
                                                    Circle()
                                                        .frame(width: 9, height: 9)
                                                        .offset(x: 5)
                                                }
                                            }
                                            .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
                                        }
                                }
                            }
                            
                        }
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(categories, id: \.self) { category in
                                    HStack {
                                        GradientButton(buttonTitle: category) {
                                            print(selectedCategory = category)
                                        }
                                        .frame(width: 100)
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 20))
                        }
                        ScrollView(.vertical) {
                            Text(selectedCategory ?? "Available")
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                withAnimation(.easeInOut) {
                                    print("MenuBar pressed")
                                }
                            }label: {
                                MenuBar()
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                print("show settings")
                            } label: {
                                Image(.screenshot)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeView()
}

struct MenuBar: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("OnBoardingBG"))
                .frame(width: 40, height: 40)
//                .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
                .overlay {
                    VStack(alignment: .center, spacing: 4.5) {
                        Rectangle()
                            .frame(width: 12, height: 3)
                            .offset(x: 5)
                        Rectangle()
                            .frame(width: 20, height: 3)
                        Rectangle()
                            .frame(width: 12, height: 3)
                            .offset(x: -5)
                    }
                    .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
                    .foregroundStyle(Color("OnBoardingBG"))
                }
        }
    }
}
struct AnimatedGradientText: View {
    @State private var isAnimating = false
    
    var gradientColors: [Color]
    
    init(gradientColors: [Color]) {
        self.gradientColors = gradientColors
    }
    
    var body: some View {
        Text("Apple.")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .mask(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .mask(Text("Apple."))
            )
            .onAppear() {
                withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    self.isAnimating.toggle()
                }
            }
            .opacity(isAnimating ? 0.8 : 1.0)
    }
}

struct TagLineView: View {
    var gradient1: [Color] = [
//        Color(red: 30/255, green: 225/255, blue: 30/255),
//        Color(red: 4/255, green: 228/255, blue: 186/255),
//        Color(red: 120/255, green: 120/255, blue: 215/255),
//        Color(red: 203/255, green: 194/255, blue: 245/255),
        Color("PinkGradient2"), Color("PinkGradient1")
        
    ]
    var body: some View {
        Text("Invest in quality ;\ninvest in ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundStyle(.white)
        +
        Text("Apple.")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundStyle(LinearGradient(
                gradient: Gradient(colors: gradient1),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
    }
}

struct SearchTab: View {
    @State var searchField: String = ""
    var body: some View {
        HStack {
            HStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search", text: $searchField)
            }
            .padding(.all, 15)
            .background(Color.white)
            .cornerRadius(40)
            .padding(.trailing, 8)
            
            Button {
                print("sort")
            } label: {
                SortView()
            }
        }
        .padding(.horizontal,12)
    }
}


struct SortView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 50, height: 50)
                .gradientForeground(colors: [Color("PinkGradient2"), Color("PinkGradient1")])
                .overlay {
                    VStack(alignment: .center, spacing: 4.5) {
                        HStack(spacing: -0.8) {
                            Circle()
                                .frame(width: 9, height: 9)
                                .offset(x: 0)
                            Rectangle()
                                .frame(width: 13, height: 4)
                                .offset(x: 5)
                                .opacity(0.5)
                        }
                        HStack(spacing: -0.8) {
                            Rectangle()
                                .frame(width: 13, height: 4)
                                .offset(x: 0)
                                .opacity(0.5)
                            Circle()
                                .frame(width: 9, height: 9)
                                .offset(x: 5)
                        }
                    }
                    .foregroundStyle(Color("OnBoardingBG"))
                }
        }
    }
}
