//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/21.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {

    @Published var image: UIImage?

    var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String

    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImageIfExists()
    }

    private func getCoinImageIfExists() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
//            print("Retrieved image from FileManager!")
        } else {
            downloadCoinImage()
//            print("Downloading image now")
        }
    }

    private func downloadCoinImage() {

        guard let url = URL(string: coin.image) else {
            return
        }

        // Universal download data from a url
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
