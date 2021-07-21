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
    
    private let dataService = CoinDataService()
    private var cancallables = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
     
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            
            }
            .store(in: &cancallables)
    }
}
