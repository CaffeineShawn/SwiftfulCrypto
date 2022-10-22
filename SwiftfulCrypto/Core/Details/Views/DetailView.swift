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
    @State private var showFullDescription: Bool = false
    private let spacing: CGFloat = 20
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(coin: CoinModel) {

        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))

    }

    var body: some View {
        ScrollView {

            VStack {

                ChartView(coin: vm.coin)
                    .padding(.vertical)

                VStack(spacing: spacing) {

                    overviewTitle
                    Divider()

                    descriptionSection

                    overviewLazyVGrid

                    additionalTitle
                    Divider()
                    additionalLazyVGrid

                    webSiteSection
                }
                .padding()

            }

            }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )

        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }

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
    private var navigationBarTrailingItems: some View {
        return
            HStack {
                Text(vm.coin.symbol.uppercased())
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
                CoinImageView(coin: vm.coin)
                    .frame(width: 25, height: 25)
            }
    }

    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                VStack {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)

                    Button(action: {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    }, label: {
                        Text(showFullDescription ? "Less" : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .accentColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

            }
        }
    }

    private var webSiteSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)

            }
            if let redditString = vm.redditURL,
               let url = URL(string: redditString) {
                Link("Reddit", destination: url)

            }
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
}
