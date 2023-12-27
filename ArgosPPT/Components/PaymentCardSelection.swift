//
//  PaymentCardSelection.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/27/23.
//

import SwiftUI

struct PaymentCardSelection: View {
    @Binding var isSelected: Bool
    @ObservedObject var cardManager: CardManager
    var card: Card
    
    var body: some View {
        HStack(spacing: 20){
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)
            
            VStack(alignment: .leading, spacing: 5){
                Text(card.name)
                    .foregroundColor(isSelected ? .white : .black)
                    .bold()
                
                Text("\(card.description)")
                    .foregroundColor(isSelected ? .white : .black)
                    .bold()
            }
            .padding()
            
            Spacer()
            
        }
        .padding(.horizontal)
        .background(isSelected ? Color("kPrimary") : Color(.systemGray5))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color("kSecondary"), lineWidth: 5)
        )
        .onTapGesture {
                   isSelected.toggle()
               }
        .frame(width: nil, alignment: .leading)
        .padding()
    }
}

#Preview {
    PaymentCardSelection(isSelected: .constant(false), cardManager: CardManager(), card: cardList[1])
}


