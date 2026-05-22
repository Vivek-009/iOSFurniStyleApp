//
//  FurnitureDashboardView.swift
//  FurnitureApp
//
//  Created by Vivek Limbani
//

import SwiftUI


// MARK: - Main Dashboard View
struct FurnitureDashboardView: View {
    @State private var selectedCategory = "All"
    @State private var selectedTab = "Home"
    @State private var searchText = ""
    @State private var isCartActive = false
    
    let categories = ["All", "Sofa", "Park bench"]
    
    var body: some View {
        ZStack {
            AppTheme.backgroundGray
                .ignoresSafeArea()
            
            NavigationLink(
                destination: FurnitureCartView(),
                isActive: $isCartActive,
                label: { EmptyView() }
            )
            .hidden()
            
            GeometryReader { geo in
                Circle()
                    .fill(AppTheme.primaryBlue.opacity(0.06))
                    .frame(width: geo.size.width * 0.9, height: geo.size.width * 0.9)
                    .offset(x: geo.size.width * 0.55, y: geo.size.height * 0.12)
                
                Circle()
                    .fill(AppTheme.primaryBlue.opacity(0.03))
                    .frame(width: geo.size.width * 0.6, height: geo.size.width * 0.6)
                    .offset(x: -geo.size.width * 0.3, y: geo.size.height * 0.5)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: - Curved Header
                ZStack(alignment: .top) {
                    HeaderBackgroundShape()
                        .fill(AppTheme.primaryBlue)
                        .frame(height: 300)
                        .ignoresSafeArea(edges: .top)
                        .shadow(color: AppTheme.primaryBlue.opacity(0.15), radius: 10, y: 5)
                    
                    VStack(spacing: 20) {
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Text("Dashboard")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "bell")
                                    .font(.system(size: 22, weight: .medium))
                                    .foregroundColor(.white)
                                    .overlay(
                                        Circle()
                                            .fill(AppTheme.accentYellow)
                                            .frame(width: 8, height: 8)
                                            .offset(x: 8, y: -8),
                                        alignment: .topTrailing
                                    )
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 18, weight: .medium))
                            
                            TextField("", text: $searchText, prompt:
                                        Text("Search furniture...")
                                .foregroundColor(.white.opacity(0.6))
                            )
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            
                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }
                        }
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.08), lineWidth: 1)
                        )
                        .padding(.horizontal, 24)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 25) {
                                ForEach(categories, id: \.self) { category in
                                    CategoryPill(
                                        title: category,
                                        isActive: selectedCategory == category
                                    ) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                            selectedCategory = category
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                        
                        
                        HStack {
                            Text("Featured Items")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Text("See all")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.black)
                                    .underline()
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        // MARK: - Featured Items Section & Cards Scroll
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 22) {
                                
                                VStack(spacing: 20) {
                                    NavigationLink(destination: FurnitureDetailView(
                                        title: "Classic Leather Arm Chair",
                                        price: "$56",
                                        imageName: "chair1",
                                        description: "Experience unparalleled comfort with our signature ergonomic classic leather wingback design. Created with premium walnut legs and top-grain tanned leather, it's the perfect statement piece for any study, office, or modern living room."
                                    )) {
                                        ProductCardView(
                                            title: "Classic Leather Arm Chair",
                                            price: "56$",
                                            image: "chair1",
                                            hasAddButton: false
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    NavigationLink(destination: FurnitureDetailView(
                                        title: "Poppy Plastic Tub Chair",
                                        price: "$42",
                                        imageName: "chair2",
                                        description: "Experience unparalleled comfort with our signature ergonomic design. The Poppy Plastic Tub Chair combines durable polypropylene with premium solid wood legs, making it the perfect addition to any modern dining room or office space. Easy to clean and built to last."
                                    )) {
                                        ProductCardView(
                                            title: "Poppy Plastic Tub Chair",
                                            price: "42$",
                                            image: "chair2",
                                            hasAddButton: false
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    NavigationLink(destination: FurnitureDetailView(
                                        title: "Minimalist Bar Stool",
                                        price: "$28",
                                        imageName: "chair3",
                                        description: "Sleek and highly functional modern minimalist bar stool with a chrome-plated steel sled frame. Lightweight and incredibly sturdy, this stool features a high-density molded seat that offers support while adding a touch of contemporary elegance to kitchen islands and high bar counters."
                                    )) {
                                        ProductCardView(
                                            title: "Minimalist Bar Stool",
                                            price: "28$",
                                            image: "chair3",
                                            hasAddButton: true
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 110)
                            }
                        }
                        
                    }
                    .padding(.top, 10)
                }
                
            }
            
            // MARK: - Floating Bottom Navigation Bar
            VStack {
                Spacer()
                FloatingTabBar(selectedTab: $selectedTab)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 8)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onChange(of: selectedTab) { oldValue, newValue in
            if newValue == "Cart" {
                isCartActive = true
                selectedTab = "Home"
            }
        }
    }
}

// MARK: - Subcomponents

struct CategoryPill: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: isActive ? .bold : .medium, design: .rounded))
                .foregroundColor(isActive ? AppTheme.textNavy : .white)
                .padding(.vertical, 10)
                .padding(.horizontal, 24)
                .background(
                    Capsule()
                        .fill(isActive ? AppTheme.accentYellow : Color.clear)
                )
        }
    }
}

struct ProductCardView: View {
    let title: String
    let price: String
    let image: String
    let hasAddButton: Bool
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 14) {
                    Text(title)
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.textNavy)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(price)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.textNavy)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(AppTheme.accentYellow)
                        )
                }
                
                Spacer()
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
            }
            .padding(.all, 20)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(AppTheme.cardBackground)
                    .shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 6)
            )
            
        }
    }
}

struct FloatingTabBar: View {
    @Binding var selectedTab: String
    
    var body: some View {
        HStack {
            TabButton(icon: "house.fill", label: "Home", isActive: selectedTab == "Home") {
                selectedTab = "Home"
            }
            
            TabButton(icon: "square.grid.2x2", label: "Categories", isActive: selectedTab == "Categories") {
                selectedTab = "Categories"
            }
            
            TabButton(icon: "heart", label: "Favorites", isActive: selectedTab == "Favorites") {
                selectedTab = "Favorites"
            }
            
            TabButton(icon: "cart", label: "Cart", isActive: selectedTab == "Cart") {
                selectedTab = "Cart"
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 6)
        )
    }
}

struct TabButton: View {
    let icon: String
    let label: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    if isActive {
                        Circle()
                            .fill(AppTheme.primaryBlue)
                            .frame(width: 44, height: 44)
                            .transition(.scale.combined(with: .opacity))
                    }
                    
                    Image(systemName: icon)
                        .font(.system(size: isActive ? 18 : 20, weight: isActive ? .bold : .medium))
                        .foregroundColor(isActive ? .white : AppTheme.textMuted)
                }
                .frame(height: 44)
                
                Text(label)
                    .font(.system(size: 11, weight: isActive ? .bold : .medium, design: .rounded))
                    .foregroundColor(isActive ? AppTheme.primaryBlue : AppTheme.textMuted)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Previews
struct FurnitureDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureDashboardView()
    }
}
