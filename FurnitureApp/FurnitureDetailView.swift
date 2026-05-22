//
//  FurnitureDetailView.swift
//  FurnitureApp
//
//  Created by Vivek Limbani
//

import SwiftUI



// MARK: - Product Detail View
struct FurnitureDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedColorIndex = 0
    @State private var currentPage = 1
    @State private var isCartActive = false
    
    let title: String
    let price: String
    let imageName: String
    let description: String
    
    init(
        title: String = "Poppy Plastic Tub Chair",
        price: String = "$56",
        imageName: String = "chair2",
        description: String = "Experience unparalleled comfort with our signature ergonomic design. The Poppy Plastic Tub Chair combines durable polypropylene with premium solid wood legs, making it the perfect addition to any modern dining room or office space. Easy to clean and built to last."
    ) {
        self.title = title
        self.price = price
        self.imageName = imageName
        self.description = description
    }
    
    let colors = [
        Color(red: 0.68, green: 0.74, blue: 0.81), // Gray-blue
        Color(red: 0.96, green: 0.50, blue: 0.15), // Orange
        Color(red: 0.16, green: 0.44, blue: 0.88)  // Royal blue
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.98, green: 0.98, blue: 0.99),
                    Color(red: 0.97, green: 0.96, blue: 0.94)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            NavigationLink(
                destination: FurnitureCartView(),
                isActive: $isCartActive,
                label: { EmptyView() }
            )
            .hidden()
            
            VStack(spacing: 0) {
                
                // MARK: - Navigation Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 18, weight: .bold))
                            Text("BACK")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                        }
                        .foregroundColor(AppTheme.primaryBlue)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isCartActive = true
                    }) {
                        Image(systemName: "bag")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppTheme.primaryBlue)
                            .frame(width: 42, height: 42)
                            .background(
                                Circle()
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 3)
                            )
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
                // MARK: - Product Showcase & Carousel
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 250, height: 250)
                                .offset(y: 15)
                                .blur(radius: 8)
                            
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color.white)
                                .frame(width: 270, height: 260)
                                .shadow(color: Color.black.opacity(0.06), radius: 20, x: 0, y: 10)
                                .overlay(
                                    SafeImage(name: imageName, fallbackIcon: "chair.fill")
                                        .cornerRadius(26)
                                        .padding(.all, 12)
                                )
                        }
                        .padding(.top, 30)
                        
                        HStack(spacing: 20) {
                            ForEach(0..<colors.count, id: \.self) { index in
                                Button(action: {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        selectedColorIndex = index
                                    }
                                }) {
                                    Circle()
                                        .fill(colors[index])
                                        .frame(width: 24, height: 24)
                                        .padding(5)
                                        .background(
                                            Circle()
                                                .stroke(AppTheme.textMuted.opacity(0.5), lineWidth: selectedColorIndex == index ? 2 : 0)
                                        )
                                }
                            }
                        }
                    }
                    .padding(.bottom, 25)
                    
                    // MARK: - Product Info Details
                    VStack(alignment: .leading, spacing: 10) {
                        Text(title)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.textNavy)
                        
                        Text(price)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.primaryBlue)
                        
                        Text(description)
                            .font(.system(size: 15))
                            .foregroundColor(AppTheme.textMuted)
                            .lineSpacing(6)
                            .padding(.top, 8)
                    }
                    .padding(.horizontal, 28)
                }
                
                Spacer()
                
                // MARK: - Bottom Wave Banner & CTA Buttons
                ZStack(alignment: .bottom) {
                    BottomWaveShape()
                        .fill(AppTheme.primaryBlue)
                        .frame(height: 136)
                    
                    HStack(spacing: 16) {
                        
                        Button(action: {
                            
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "bubble.left")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Chat")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                            }
                            .foregroundColor(AppTheme.textNavy)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                    .fill(AppTheme.accentYellow)
                            )
                        }
                        
                        Button(action: {
                            
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "bag.badge.plus")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Add to cart")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                            }
                            .foregroundColor(AppTheme.textNavy)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(
                                Capsule()
                                    .fill(AppTheme.accentYellow)
                            )
                        }
                        .frame(width: 200)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: - Previews
struct FurnitureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureDetailView()
    }
}
