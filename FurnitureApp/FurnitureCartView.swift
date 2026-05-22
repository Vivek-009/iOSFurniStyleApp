//
//  FurnitureCartView.swift
//  FurnitureApp
//
//  Created by Vivek Limbani
//

import SwiftUI

// MARK: - Cart Model
struct CartItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let price: Double
    var quantity: Int
    let imageName: String
}

// MARK: - Main Cart View
struct FurnitureCartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var cartItems = [
        CartItem(title: "Classic Leather Arm Chair", subtitle: "Tan Brown / Walnut", price: 56.0, quantity: 1, imageName: "chair1"),
        CartItem(title: "Poppy Plastic Tub Chair", subtitle: "Teal Blue / Dark Wood", price: 56.0, quantity: 2, imageName: "chair2"),
        CartItem(title: "Bar Stool Chair", subtitle: "White / Chrome", price: 56.0, quantity: 1, imageName: "chair3")
    ]
    
    let shippingCost = 12.00
    
    var subtotal: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var total: Double {
        subtotal > 0 ? (subtotal + shippingCost) : 0.0
    }
    
    var body: some View {
        ZStack {
            AppTheme.backgroundGray
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Circle()
                    .fill(AppTheme.primaryBlue.opacity(0.04))
                    .frame(width: geo.size.width * 0.9, height: geo.size.width * 0.9)
                    .offset(x: geo.size.width * 0.5, y: -geo.size.width * 0.2)
                
                Circle()
                    .fill(AppTheme.primaryBlue.opacity(0.03))
                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                    .offset(x: -geo.size.width * 0.4, y: geo.size.height * 0.6)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: - Top Custom Navigation Bar
                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("Dashboard")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "bell")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(AppTheme.primaryBlue)
                }
                
                // MARK: - Cart Header Title
                HStack(alignment: .bottom) {
                    Text("Your Cart")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.textNavy)
                    
                    Spacer()
                    
                    Text("\(cartItems.reduce(0) { $0 + $1.quantity }) Items")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(AppTheme.textMuted)
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 16)
                
                // MARK: - Scrollable Cart Items List
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 18) {
                        if cartItems.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "cart.badge.questionmark")
                                    .font(.system(size: 60))
                                    .foregroundColor(AppTheme.textMuted.opacity(0.5))
                                    .padding(.top, 40)
                                Text("Your cart is empty")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    .foregroundColor(AppTheme.textMuted)
                            }
                        } else {
                            ForEach($cartItems) { $item in
                                CartItemRow(
                                    item: $item,
                                    onDelete: {
                                        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
                                            _ = withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                                cartItems.remove(at: index)
                                            }
                                        }
                                    }
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                }
                
                // MARK: - Pricing Summary Panel
                if !cartItems.isEmpty {
                    VStack(spacing: 8) {
                        HStack {
                            Text("Subtotal")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                            Spacer()
                            Text(String(format: "%.2f$", subtotal))
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        HStack {
                            Text("Shipping")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                            Spacer()
                            Text(String(format: "%.2f$", shippingCost))
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                            .background(Color.white.opacity(0.3))
                            .padding(.vertical, 4)
                        
                        HStack {
                            Text("Total")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                            Text(String(format: "%.2f$", total))
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.all, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 28)
                            .fill(AppTheme.primaryBlue)
                            .shadow(color: AppTheme.primaryBlue.opacity(0.15), radius: 10, x: 0, y: 6)
                    )
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                }
                
                // MARK: - Bottom Checkout Action
                VStack {
                    Button(action: {
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "cart")
                                .font(.system(size: 18, weight: .bold))
                            Text("Checkout")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
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
                    .disabled(cartItems.isEmpty)
                    .opacity(cartItems.isEmpty ? 0.6 : 1.0)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .padding(.bottom, 16)
                .background(
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.04), radius: 12, x: 0, y: -6)
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
}


struct CartItemRow: View {
    @Binding var item: CartItem
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(AppTheme.backgroundGray)
                    .frame(width: 80, height: 80)
                
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .top) {
                    Text(item.title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.textNavy)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Button(action: onDelete) {
                        Image(systemName: "trash")
                            .font(.system(size: 15))
                            .foregroundColor(.red)
                            .padding(.all, 4)
                    }
                }
                
                Text(item.subtitle)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(AppTheme.textMuted)
                
                HStack {
                    Text(String(format: "%.0f$", item.price))
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.textNavy)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(AppTheme.accentYellow)
                        )
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            if item.quantity > 1 {
                                item.quantity -= 1
                            }
                        }) {
                            Text("-")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(AppTheme.textNavy)
                                .frame(width: 24, height: 24)
                        }
                        
                        Text("\(item.quantity)")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.textNavy)
                            .frame(width: 16)
                        
                        Button(action: {
                            item.quantity += 1
                        }) {
                            Text("+")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(AppTheme.textNavy)
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(8)
                }
            }
        }
        .padding(.all, 14)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.03), radius: 8, x: 0, y: 4)
        )
    }
}

// MARK: - Previews
struct FurnitureCartView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureCartView()
    }
}
