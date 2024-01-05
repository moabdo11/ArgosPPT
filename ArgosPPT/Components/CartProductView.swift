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
        HStack(alignment:.center){
            Image(product.cartImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.all, 20)
                
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.system(size: 26, weight: .bold, design: .default))
                                       .foregroundColor(.white)
                Text(product.category)
                    .font(.system(size: 16, weight: .bold, design: .default))
                                        .foregroundColor(.gray)
                Text("$ \(product.price)")
                    .font(.system(size: 16, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                            .padding(.top, 8)
            }.padding(.trailing, 20)
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(.red)
                .padding(.trailing, 20)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .frame(maxWidth: .infinity, alignment: .center)
              .background(Color(red: 32/255, green: 36/255, blue: 38/255))
              .modifier(CardModifier())
              .padding(.all, 10)
    }
}

#Preview {
    CartProductView(cartManager: CartManager(), product: productList[2])
}
