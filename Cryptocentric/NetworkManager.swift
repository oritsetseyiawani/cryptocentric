//
//  NetworkManager.swift
//  Cryptocentric
//
//  Created by Oritsetseyi Awani on 28/04/2022.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var coins: [Datum] = []
    
    func fetchData(){
        let newsUrl = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=USD&CMC_PRO_API_KEY=87030b2c-4a00-4df4-8ff3-136a941b2a22")
        if let url = newsUrl{
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    if let safeData = data {
                        
                        let decoder = JSONDecoder()
                        do {
                            let results = try decoder.decode( CoinData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.coins = results.data
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
