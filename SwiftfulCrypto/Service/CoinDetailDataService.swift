//
//  CoinDetailModel.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/23.
//



import Foundation
import Combine

class CoinDetailDataService {
    
    // ViewModel subscribles to this publisher
    @Published var coinDetails: CoinDetailModel? = nil
    
    let coin: CoinModel
    
    var coinDetailSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
            return
        }
        
        // Universal download data from a url
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            // wtf is sink? completion? weak self?
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
            
            
    }
    
    
    
}
