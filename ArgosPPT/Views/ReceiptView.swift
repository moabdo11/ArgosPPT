//
//  ReceiptView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/14/23.
//

import SwiftUI

struct ReceiptView: View {
    @ObservedObject var cartManager: CartManager
    var merchantLogo: Image // Add your merchant logo image here
    var currentDate: Date
    
    var body: some View {
        VStack {
            // Merchant Logo Section
            merchantLogo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            
           
            
            // Product Items Section
            ForEach(cartManager.cartItems) { product in
                HStack {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(9)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(product.name)
                            .bold()
                        
                        Text("$ \(product.price)")
                            .bold()
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding(.horizontal)
                .background(Color("kSecondary"))
                .cornerRadius(12)
                .padding()
            }
            
            // Total Section
                      HStack {
                          Spacer()
                          Text("Total: $ \(cartManager.total)")
                              .font(.headline)
                              .padding()
                      }
            
            // Reward Points Section
            HStack {
                Spacer()
                Text("Earned Reward Points: \(Int(cartManager.total))")
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding()
            }
            
            // Total Reward Points for Merchant Section
            HStack {
                Spacer()
                Text("Total Reward Points: \(cartManager.totalRewardPointsForMerchant)")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding()
            }
            
            Spacer()
                .preferredColorScheme(.light)
        }
    }
}

#Preview {
    ReceiptView(cartManager: CartManager(), merchantLogo: Image("YourMerchantLogo"), currentDate: Date())
}
