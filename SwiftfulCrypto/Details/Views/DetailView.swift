//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/23.
//

import SwiftUI

struct DetailLoadingView: View {
    
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}



struct DetailView: View {
    @StateObject var vm: DetailViewModel
    private let spacing: CGFloat = 20
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(coin: CoinModel) {
    
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: spacing) {
                Text("")
                    .frame(height: 150)
                
                
                
                overviewTitle
                Divider()
                overviewLazyVGrid
                
                additionalTitle
                Divider()
                additionalLazyVGrid
            }
            .padding()
            
        }
        .navigationTitle(vm.coin.name)
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
        
    }
}


extension DetailView {
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var overviewLazyVGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
                    ForEach(vm.overviewSatistics) { stat in
                        StatisticView(stat: stat)
                    }
        })
    }
    
    private var additionalTitle: some View {
         Text("Additional Details")
             .font(.title)
             .bold()
             .foregroundColor(Color.theme.accent)
             .frame(maxWidth: .infinity, alignment: .leading)
         
    }
    private var additionalLazyVGrid: some View {
         LazyVGrid(columns: columns,
                   alignment: .leading,
                   spacing: spacing,
                   pinnedViews: [],
                   content: {
                     ForEach(vm.additionalSatistics) { stat in
                         StatisticView(stat: stat)
                     }
         })
    }
    
}
