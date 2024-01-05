//
//  ProductsView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/12/23.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var cartManager: CartManager
    
    init(cartManager: CartManager) {
            self.cartManager = cartManager
        }
    
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: column, spacing: 20){
                    ForEach(productList, id: \.id) {product in
                        ProductCardView(cartManager: cartManager, product: product)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("All your deals"))
            .preferredColorScheme(.light)
        }
    }
}

#Preview {
    ProductsView(cartManager: CartManager())
}
