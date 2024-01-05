//
//  CartView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/11/23.
//

import SwiftUI

struct CartView: View {
    @StateObject private var manager = NotificationsManager()
    @ObservedObject var cartManager: CartManager
    @ObservedObject var cardManager: CardManager
    @State private var isPaymentButtonTapped = false
    
    init(cartManager: CartManager, cardManager: CardManager) {
            self.cartManager = cartManager
            self.cardManager = cardManager
        }
    
    
    var body: some View {
        ScrollView{
            
            CardSelectionView(cardManager: cardManager)
            
            Text("Your cart")
                .bold()
            
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
                
                // Use NavigationLink directly tied to the Payment Button action
                              NavigationLink(
                                  destination: ReceiptView(cartManager: cartManager,  merchantLogo: Image("your_logo_image"), currentDate: Date()),
                                  isActive: $isPaymentButtonTapped,
                                  label: {
                                      EmptyView() // This empty view is used as a workaround for a known issue with NavigationLink
                                  }
                              )
                              .hidden() // Hide the navigation link, as it's triggered by the Payment Button action

                              PaymentButton(action: {
                                  // Perform any necessary actions before navigating to Receipts View
                                  isPaymentButtonTapped = true
                              })
                              .padding()
                          } else {
                              Text("Your cart is empty")
                          }
                      }
                      .navigationTitle(Text("My Cart"))
                      .padding(.top)
                      .preferredColorScheme(.light)
                  }
              }


#Preview {
    CartView(cartManager: CartManager(), cardManager: CardManager())
}
