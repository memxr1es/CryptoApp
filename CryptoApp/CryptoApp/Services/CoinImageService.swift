//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Никита Котов on 21.09.2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager.")
        } else {
            downloadCoinImage()
            print("Downloading image now!")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedImage in
                guard
                    let self = self,
                    let downloadImage = returnedImage
                else { return }
                
                self.image = downloadImage
                self.imageSubscription?.cancel() // because we call an API once
                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            }

    }
}
