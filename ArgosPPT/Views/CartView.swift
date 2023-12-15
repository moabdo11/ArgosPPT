//
//  CartView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/11/23.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartManager: CartManager
    
    init(cartManager: CartManager) {
            self.cartManager = cartManager
        }
    
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id){product in
                    CartProductView(cartManager: cartManager, product: product)
                }
                HStack{
                    Text("Your Total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            }else {
                Text("Your cart is empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let cartManager = CartManager()
        CartView(cartManager: cartManager)
    }
}
