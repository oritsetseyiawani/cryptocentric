//
//  ContentView.swift
//  Cryptocentric
//
//  Created by Oritsetseyi Awani on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager: NetworkManager = NetworkManager()
    var body: some View {
            NavigationView {
                List(networkManager.coins){ coin in
                    NavigationLink(destination: DetailView(coin: coin)) {
                            HStack {
                                let imageBaseUrl = "https://raw.githubusercontent.com/coinwink/cryptocurrency-logos/master/coins/32x32/\(coin.id).png"
                                AsyncImage(url: URL(string: imageBaseUrl))
                                    .frame(width: 32, height: 32)

                                VStack(alignment: .leading) {
                                   
                                    Text("\(coin.name)")
                                    Text("\(coin.symbol)")
                                }
                                Spacer()
                                Text( "$" + String(format: "%.2f", coin.quote.usd.price))
                                      
                                    
                            }
                    }
                }.navigationBarTitle("Coin News")
            }.onAppear(){
                self.networkManager.fetchData()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
