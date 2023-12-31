//
//  ShareCardView.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 1/4/24.
//

import SwiftUI

struct ShareCardView: View {
    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                // Left Section
                VStack(alignment: .leading) {
                    Text("Send Money to")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                    
                    LazyHStack(spacing: -5) {
                        ForEach(avatars, id: \.self) { value in
                            CircularImageView(image: value, size: 40)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(.black,lineWidth: 1)
                                }
                        }
                    }
                    .frame(height: 60)
                }
                
                Spacer()
                
                //Right Section
                ZStack{
                    Image(systemName: "magnifyingglass")
                        .padding(.vertical, 20)
                        .padding(.horizontal)
                }
                .background(Color("kSecondary"))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(Color("kPrimary"))
        .cornerRadius(25)
        .padding(.horizontal)
        .padding(.top, 30)
    }
}

struct ShareCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShareCardView()
            .previewLayout(.sizeThatFits)
    }
}
