//
//  Product.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/8/23.
//

import Foundation

struct Product : Identifiable {
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

var productList = [
    Product(name: "Leather Couch",
            image: "fn1",
            description: "Beautiful leather couch, sylish and beautiful. You should buy 10 of these becuase chances are you can resell them for a billion dollars each. Which then means you'll have 10 Billion dollars, then you can start your own couch store. Don't miss out on this exclusive opportunity.",
            merchant: "Target",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           ),
    Product(name: "Nice Couch",
            image: "fn2",
            description: "Beautiful leather couch, sylish and beautiful. You should buy 10 of these becuase chances are you can resell them for a billion dollars each. Which then means you'll have 10 Billion dollars, then you can start your own couch store. Don't miss out on this exclusive opportunity.",
            merchant: "Walmart",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           ),
    Product(name: "Great Couch",
            image: "fn3",
            description: "Beautiful leather couch, sylish and beautiful. You should buy 10 of these becuase chances are you can resell them for a billion dollars each. Which then means you'll have 10 Billion dollars, then you can start your own couch store. Don't miss out on this exclusive opportunity.h",
            merchant: "IKEA",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           ),
    Product(name: "Cool Couch",
            image: "fn4",
            description: "Beautiful leather couch, sylish and beautiful. You should buy 10 of these becuase chances are you can resell them for a billion dollars each. Which then means you'll have 10 Billion dollars, then you can start your own couch store. Don't miss out on this exclusive opportunity.",
            merchant: "Jordans",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           ),
    Product(name: "Sexy Couch",
            image: "fn5",
            description: "Beautiful leather couch, sylish and beautiful. You should buy 10 of these becuase chances are you can resell them for a billion dollars each. Which then means you'll have 10 Billion dollars, then you can start your own couch store. Don't miss out on this exclusive opportunity.",
            merchant: "Macys",
            price: 350,
            width: "200c cm",
            height: "135 cm",
            diameter: "105 cm"
           )
]
