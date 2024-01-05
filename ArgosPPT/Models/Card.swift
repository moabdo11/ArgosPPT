//
//  Card.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/27/23.
//

import Foundation

struct Card : Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var merchant: String
    var price: Int
    var width: String
    var height: String
    var diameter: String
    
}

var cardList = [
    Card(name: "Argos Platinum",
            image: "ac1",
            description: "Credit",
            merchant: "Walmart",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           ),
    Card(name: "Argos Edge",
            image: "ac2",
            description: "Debit",
            merchant: "Walmart",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           )
]
