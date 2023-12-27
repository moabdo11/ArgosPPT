//
//  CartProductView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/11/23.
//

import SwiftUI

struct CartProductView: View {
    @ObservedObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.all, 20)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.name)
                    .bold()
                
                Text("$ \(product.price)")
                    .bold()
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("kSecondary"))
        .cornerRadius(20)
        .frame(width: nil, alignment: .leading)
        .padding(.all, 10)
    }
}

#Preview {
    CartProductView(cartManager: CartManager(), product: productList[2])
}
