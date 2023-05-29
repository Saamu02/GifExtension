//
//  ImageView.swift
//  GifExtension
//
//  Created by Ussama Irfan on 29/05/2023.
//

import ImageIO


import UIKit
import ImageIO

extension UIImageView {
    
    func gifImage(gifURL: URL, withAnimationDuration animationDuration: TimeInterval = 1.0) {
        self.animationImages = getGifImage(gifURL: gifURL)
        self.animationDuration = animationDuration
        self.startAnimating()
    }
        
    private func getGifImage(gifURL: URL) -> [UIImage] {
        guard let imageData = try? Data(contentsOf: gifURL) else { return [] }
        guard let imageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else { return [] }
        
        let frameCount = CGImageSourceGetCount(imageSource)

        var images = [UIImage]()
        
        for index in 0..<frameCount {
            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, index, nil) else { continue }
            let uiImage = UIImage(cgImage: cgImage)
            images.append(uiImage)
        }
        
        return images
    }
}
