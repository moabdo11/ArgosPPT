//
//  Product.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/8/23.
//

import Foundation

struct Product : Identifiable {
    var id = UUID()
    var name = String()
    var image = String()
    var description = String()
    var merchant = String()
    var price = Int()
    
}

var productList = [
    Product(name: "Leather Couch",
            image: "fn1",
            description: "Beautiful leather couch",
            merchant: "Target",
            price: 350
           ),
    Product(name: "Nice Couch",
            image: "fn2",
            description: "Beautiful leather couch",
            merchant: "Walmart",
            price: 350
           ),
    Product(name: "Great Couch",
            image: "fn3",
            description: "Beautiful leather couch",
            merchant: "IKEA",
            price: 350
           ),
    Product(name: "Cool Couch",
            image: "fn4",
            description: "Beautiful leather couch",
            merchant: "Jordans",
            price: 350
           ),
    Product(name: "Sexy Couch",
            image: "fn5",
            description: "Beautiful leather couch",
            merchant: "Macys",
            price: 350
           )
]
