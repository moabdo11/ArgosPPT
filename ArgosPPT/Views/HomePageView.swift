//
//  HomePageView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/11/23.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var cartManager: CartManager
    @ObservedObject var cardManager: CardManager

       init(cartManager: CartManager) {
           self.cartManager = cartManager
           self.cardManager = CardManager()
       }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                Color.white
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView{
                VStack{
                    AppBar(cartManager: cartManager, cardManager: cardManager)
                    
                    SearchView()
                    
                    ImageSliderView()
                    
                    HStack{
                        Text("New Deals")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            ProductsView(cartManager: cartManager)
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("kPrimary"))
                        })
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(productList, id: \.id){product in
                                NavigationLink{
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(cartManager: cartManager, product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.bottom, 100)
                }
                
            }
               
            }
        }
    }
}

struct AppBar: View {
    @ObservedObject var cartManager: CartManager
    @ObservedObject var cardManager: CardManager
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    
                    Text("Boston, MA")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    NavigationLink(destination: CartView(cartManager: cartManager, cardManager: cardManager)){
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
                Text("Find the best deals")
                    .font(.largeTitle .bold())
                
                Text("Rewards")
                    .font(.largeTitle .bold())
                    .foregroundColor(Color("kPrimary"))
            }
        }
        .padding()
    }
}

#Preview {
    HomePageView(cartManager: CartManager())
}

