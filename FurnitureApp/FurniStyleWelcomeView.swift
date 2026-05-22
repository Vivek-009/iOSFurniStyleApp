//
//  FurniStyleWelcomeView.swift
//  FurnitureApp
//
//  Created by Vivek Limbani
//

import SwiftUI


// MARK: - Main Welcome View
struct FurniStyleWelcomeView: View {
    @State private var isDashboardActive = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.backgroundGray
                    .ignoresSafeArea()
                
                GeometryReader { geo in
                    Circle()
                        .fill(AppTheme.primaryBlue.opacity(0.05))
                        .frame(width: geo.size.width * 0.9, height: geo.size.width * 0.9)
                        .offset(x: geo.size.width * 0.15, y: -geo.size.height * 0.08)
                }
                .ignoresSafeArea()
                
                NavigationLink(
                    destination: FurnitureDashboardView(),
                    isActive: $isDashboardActive,
                    label: { EmptyView() }
                )
                .hidden()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // MARK: - Brand Title
                        Text("FurniStyle")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.textNavy)
                            .padding(.top, 16)
                        
                        // MARK: - Hero Curved Card
                        ZStack(alignment: .bottomTrailing) {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(red: 0.95, green: 0.90, blue: 0.78))
                                .frame(width: 320, height: 350)
                            
                            RoundedRectangle(cornerRadius: 38)
                                .fill(Color.white)
                                .frame(width: 310, height: 340)
                                .overlay(
                                    SafeImage(name: "chair6", fallbackIcon: "sofa.fill")
                                        .cornerRadius(30)
                                        .padding(.all, 14)
                                )
                                .offset(x: -5, y: -5)
                            
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(AppTheme.accentYellow)
                                    .frame(width: 32, height: 32)
                                    .overlay(
                                        Image(systemName: "leaf.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                    )
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Sustainable")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(AppTheme.textNavy)
                                    Text("MATERIALS")
                                        .font(.system(size: 9, weight: .bold))
                                        .foregroundColor(AppTheme.textMuted)
                                }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
                            )
                            .offset(x: 20, y: 15)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)
                        
                        // MARK: - Headline text
                        VStack(spacing: 12) {
                            VStack(spacing: 0) {
                                Text("Elevate Your ")
                                    .font(.system(size: 44, weight: .bold, design: .rounded))
                                    .foregroundColor(AppTheme.textNavy)
                                
                                VStack(spacing: 2) {
                                    Text("Space")
                                        .font(.system(size: 44, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.primaryBlue)
                                    
                                    WavyUnderlineShape()
                                        .stroke(AppTheme.accentYellow, lineWidth: 3)
                                        .frame(width: 90, height: 8)
                                }
                            }
                            
                            Text("Discover curated furniture collections that blend modern aesthetics with timeless comfort. Transform your house into a home today.")
                                .font(.system(size: 15))
                                .foregroundColor(AppTheme.textMuted)
                                .multilineTextAlignment(.center)
                                .lineSpacing(6)
                                .padding(.horizontal, 24)
                        }
                        .padding(.top, 10)
                        
                        // MARK: - Action CTAs
                        VStack(spacing: 14) {
                            Button(action: {
                                isDashboardActive = true
                            }) {
                                HStack(spacing: 8) {
                                    Text("Get Started")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 15, weight: .bold))
                                }
                                .foregroundColor(AppTheme.textNavy)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    Capsule()
                                        .fill(AppTheme.accentYellow)
                                        .shadow(color: AppTheme.accentYellow.opacity(0.3), radius: 8, x: 0, y: 4)
                                )
                            }
                            
                            Button(action: {
                                isDashboardActive = true
                            }) {
                                Text("Browse Catalog")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(AppTheme.textNavy)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        Capsule()
                                            .stroke(AppTheme.textMuted.opacity(0.2), lineWidth: 1)
                                            .background(Color.white.opacity(0.5))
                                    )
                            }
                        }
                        .padding(.horizontal, 28)
                        
                        // MARK: - Stats Section
                        VStack(spacing: 16) {
                            Divider()
                                .background(AppTheme.textMuted.opacity(0.15))
                            
                            HStack {
                                Spacer()
                                VStack(spacing: 6) {
                                    Text("12k+")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.textNavy)
                                    Text("Premium Products")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(AppTheme.textMuted)
                                }
                                Spacer()
                                Divider()
                                    .frame(height: 40)
                                    .background(AppTheme.textMuted.opacity(0.15))
                                Spacer()
                                VStack(spacing: 6) {
                                    Text("4.9/5")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.textNavy)
                                    Text("Customer Rating")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(AppTheme.textMuted)
                                }
                                Spacer()
                            }
                            
                            Divider()
                                .background(AppTheme.textMuted.opacity(0.15))
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        
                        // MARK: - New Arrivals Header
                        VStack(alignment: .leading, spacing: 20) {
                            Text("New Arrivals")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.textNavy)
                                .padding(.horizontal, 24)
                            
                            LazyVGrid(columns: columns, spacing: 18) {
                                ArrivalCard(title: "Sunray Chair", price: "$240.00", imageName: "chair1", fallback: "chair.fill")
                                ArrivalCard(title: "Orbit Table", price: "$186.00", imageName: "chair2", fallback: "circle.grid.3x3.fill")
                                ArrivalCard(title: "Luna Stool", price: "$120.00", imageName: "chair3", fallback: "table.furniture.fill")
                                ArrivalCard(title: "Aura Lamp", price: "$95.00", imageName: "lamp1", fallback: "lightbulb.fill")
                            }
                            .padding(.horizontal, 24)
                        }
                        
                        // MARK: - Footer
                        Text("© 2024 FurniStyle Modern Living. All rights reserved.")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(AppTheme.textMuted.opacity(0.7))
                            .padding(.top, 20)
                            .padding(.bottom, 24)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Safe Image Loader
struct SafeImage: View {
    let name: String
    let fallbackIcon: String
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    
    var body: some View {
        if UIImage(named: name) != nil {
            Image(name)
                .resizable()
                .scaledToFill()
        } else {
            
            ZStack {
                Color.gray.opacity(0.12)
                Image(systemName: fallbackIcon)
                    .font(.system(size: 32))
                    .foregroundColor(AppTheme.textMuted.opacity(0.6))
            }
        }
    }
}


// MARK: - Arrival Card Component
struct ArrivalCard: View {
    let title: String
    let price: String
    let imageName: String
    let fallback: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 22)
                    .fill(AppTheme.backgroundGray)
                    .frame(height: 140)
                
                SafeImage(name: imageName, fallbackIcon: fallback)
                    .cornerRadius(18)
                    .padding(.all, 8)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.textNavy)
                    .lineLimit(1)
                
                Text(price)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.primaryBlue)
            }
            .padding(.horizontal, 8)
        }
        .padding(.all, 12)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.02), radius: 6, x: 0, y: 3)
        )
    }
}

// MARK: - Previews
struct FurniStyleWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        FurniStyleWelcomeView()
    }
}
