//
//  CartManger.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/10/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    
     var cartItems: [Product] {
        return products
    }
    
    func addToCart(product: Product) {
        products.append(product)
        objectWillChange.send()
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
    
    var total: Double {
           return Double(products.reduce(0) { $0 + $1.price })
       }
    
    var totalRewardPointsForMerchant: Int {
        return Int(total)
    }
}
