//
//  PreviewProvider.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import Foundation
import SwiftUI

extension PreviewProvider {

    // Access to devPreview by DevPreview.instance and not allow to access in real view
    static var dev: DeveloperPreview { // where the dev comes from
        DeveloperPreview.instance
    }
}

class DeveloperPreview {

    static let instance = DeveloperPreview()

    let homeVM = HomeViewModel()
    // Only initializer
    private init() {

    }

    let stat1 = StatisticModel(title: "Market Cap", value: "$114.514Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: " $19.19Tr")
    let stat3 = StatisticModel(title: "Portfolio Volume", value: " $51.4k", percentageChange: -11.4)

    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 29780,
        marketCap: 558090011502,
        marketCapRank: 1,
        fullyDilutedValuation: 624678742705,
        totalVolume: 23374534953,
        high24H: 31901,
        low24H: 29622,
        priceChange24H: -2076.783773672051,
        priceChangePercentage24H: -6.51913,
        marketCapChange24H: -39745563781.75281,
        marketCapChangePercentage24H: -6.64824,
        circulatingSupply: 18761468,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 64805,
        athChangePercentage: -54.09809,
        athDate: "2021-04-14T11:54:46.763Z",
        atl: 67.81,
        atlChangePercentage: 43768.2281,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2021-07-20T06:43:25.636Z",
        sparklineIn7D: SparklineIn7D(price: [
            32882.59203070054,
            33084.03095380364,
            33234.58022057215,
            33291.42599371452,
            33327.47500740664,
            33154.79164955665,
            33209.87427849121,
            32482.048243412803,
            32618.450117897184,
            32613.987628689796,
            32871.01519128446,
            32848.53554424778,
            32836.81052934152,
            32599.34902377462,
            32418.78152105939,
            32495.99533426632,
            32663.552886565623,
            32572.967297791212,
            32728.91957929776,
            32510.706508089726,
            32529.925515905128,
            32610.115740390207,
            31886.581599925088,
            32019.66522080067,
            31893.935644122685,
            32013.011492257756,
            32052.95206153006,
            31856.382636639722,
            32313.166977511155,
            32546.563045800034,
            32492.588253776114,
            32465.104683579608,
            32893.1116293346,
            32924.323881063625,
            32879.81131838133,
            32937.52720465523,
            32967.899681668736,
            32812.31919618619,
            32947.896063291046,
            32916.832546637364,
            32971.734821452505,
            33094.153413666376,
            32878.50187357147,
            33098.66196408383,
            32892.51003039339,
            32831.177409863005,
            32815.47592027431,
            32733.97201277604,
            32665.320559561045,
            32637.09516802921,
            32515.51984620484,
            32510.169526676225,
            32592.853350422538,
            31888.01878193026,
            32040.193011094256,
            31899.79526922074,
            31982.96858598392,
            31952.165763498353,
            31836.137554548637,
            31714.39314844427,
            31372.65349362719,
            31568.26587829246,
            31676.53371964565,
            31849.449001800644,
            31888.51888392571,
            31850.536936755874,
            31686.63517370822,
            31641.944216127133,
            31906.611274765746,
            32035.178569636882,
            31985.01513411309,
            32022.429750165935,
            31881.68546573872,
            31673.228496585925,
            31762.613710231944,
            31462.099976992733,
            31460.18913762625,
            31376.648172176003,
            31174.142553818387,
            31596.698155750597,
            31850.59075834972,
            31919.695853277753,
            32196.821371601978,
            32044.057814178574,
            32059.55467578765,
            32014.142121338526,
            31896.018787784265,
            31908.97376645972,
            31808.97977877344,
            31602.173424744837,
            31404.36550884456,
            31609.88109929828,
            31340.32262847881,
            31376.22220806561,
            31370.613910348766,
            31455.56002017076,
            31499.3748141696,
            31603.431396238466,
            31530.636207959764,
            31973.261936093702,
            31672.82893516178,
            31428.432143886603,
            31508.849179957127,
            31569.424448820573,
            31804.40976442925,
            31749.125626888304,
            31833.020963141073,
            31738.99128008706,
            31788.061027928077,
            31787.60935046265,
            31923.853802154714,
            31818.848444285675,
            31787.894580986092,
            31704.688442213668,
            31588.6713510167,
            31955.814996512305,
            32181.500547977685,
            32239.857247080956,
            32198.39515607215,
            32142.68580301455,
            32137.30459445944,
            31957.32182124855,
            31880.641430305495,
            31792.694381561512,
            31889.554138647538,
            31763.832333597322,
            31854.81738000319,
            31833.583777609132,
            31685.428646118526,
            31262.148761343185,
            31469.26013804458,
            31612.175373480713,
            31831.694703852383,
            31699.617332024765,
            31716.68642016188,
            31775.350489540127,
            31836.846214448662,
            31614.674467917328,
            31919.393922554555,
            31627.14249745743,
            31602.889827929564,
            31622.446197091256,
            31648.28289270773,
            31818.907377971987,
            31931.418111985462,
            31841.66592199561,
            31681.09763318172,
            31595.005765614947,
            31385.620814796814,
            31330.710526534076,
            31328.284239953307,
            30778.356744525663,
            30693.310472907266,
            30865.568593632568,
            30837.238736794352,
            30778.308905096143,
            30793.119266580918,
            30713.250156452683,
            30800.306605123173,
            30888.54720517775,
            30831.4542812602,
            30965.831960798874,
            30928.211908849244,
            30974.89741294752,
            30721.96792010206,
            30322.32005470183,
            29689.319956284926,
            29772.658743726966
            ]),
        priceChangePercentage24HInCurrency: -6.519130184195057,
        currentHoldings: 1.5
      )
}
