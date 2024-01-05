//
//  NavigationManager.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/27/23.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()

    @Published var currentView: AnyView?

    func navigateToCartView(cartManager: CartManager, cardManager: CardManager) {
            // Replace this with your actual navigation code
            let cartView = CartView(cartManager: cartManager, cardManager: cardManager)
            currentView = AnyView(cartView)
        }
}
