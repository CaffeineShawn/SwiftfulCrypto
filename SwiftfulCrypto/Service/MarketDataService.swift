//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/22.
//

import Foundation
import Combine

class MarketDataService {
    

    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        // Universal download data from a url
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            // wtf is sink? completion? weak self?
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
            
            
    }
    
    
    
}
