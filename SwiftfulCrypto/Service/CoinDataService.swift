//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import Foundation
import Combine

class CoinDataService {
    
    // ViewModel subscribles to this publisher
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
        // Universal download data from a url
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder()) // decode in the bg thread then switch back to main thread
            // wtf is sink? completion? weak self?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
            
            
    }
    
    
    
}
