//
//  DetailView.swift
//  Cryptocentric
//
//  Created by Oritsetseyi Awani on 28/04/2022.
//

import SwiftUI

struct DetailView: View {
    var coin: Datum?

    var body: some View {
        
        if let coin = coin {
            ZStack {
                VStack() {
                    let imageBaseUrl = "https://raw.githubusercontent.com/coinwink/cryptocurrency-logos/master/coins/128x128/\(coin.id).png"
                
                    AsyncImage(url: URL(string: imageBaseUrl)).frame(width: 128, height: 128, alignment: .center)
                   
                    HStack {
                        
                        Text("\(coin.symbol)")
                       
                    }
                    Divider()
                
                
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Name: \(coin.name)").frame(alignment: .leading)
                            Text( "Price: $" + String(format: "%.2f", coin.quote.usd.price))
                            Text("Circulating supply: " + String(format: "%.2f",coin.circulatingSupply))
                            Text("Total supply: " + String(format: "%.2f",coin.totalSupply))
                            
                        }.padding()
                        Spacer()
                    }
                    
                    Spacer()
                }

            }
                
                
               
        }
        
       
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: nil)
    }
}
