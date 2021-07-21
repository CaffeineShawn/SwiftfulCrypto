//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancallables = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
     
    func addSubscribers() {
        
        $searchText
            .combineLatest(dataService.$allCoins)// 河南人偷数据咯
            .debounce(for: .seconds(0.1), scheduler: DispatchQueue.main)// Waiting for 0.5s to resume
            .map(filterCoins) // default args
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancallables)
        
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) || coin.symbol.lowercased().contains(lowercasedText) || coin.id.lowercased().contains(lowercasedText)
        }
    }
}
