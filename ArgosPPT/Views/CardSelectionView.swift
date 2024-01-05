//
//  CardSelectionView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/27/23.
//

import SwiftUI

struct CardSelectionView: View {
    @ObservedObject var cardManager: CardManager
    
    init(cardManager: CardManager) {
            self.cardManager = cardManager
        }
    
    @State private var selectedCardID: UUID?
    @State private var isSelectedDict: [UUID: Bool] = [:]
    

    var body: some View {
        VStack (spacing: 30){
            Text("Please Select Payment option")
                .bold()
            ScrollView {
                ForEach(cardList, id: \.id){card in
                    PaymentCardSelection(
                        isSelected: Binding(
                                                   get: {
                                                       isSelectedDict[card.id] ?? false
                                                   },
                                                   set: { newValue in
                                                       isSelectedDict[card.id] = newValue
                                                       if newValue {
                                                           selectedCardID = card.id
                                                           // Deselect other cards
                                                           for otherCard in cardList where otherCard.id != card.id {
                                                               isSelectedDict[otherCard.id] = false
                                                           }
                                                       }
                                                   }
                                               ),
                        cardManager: cardManager,
                        card: card
                    )
                    .onTapGesture {
                        isSelectedDict[card.id]?.toggle()
                        
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CardSelectionView(cardManager: CardManager())
}
