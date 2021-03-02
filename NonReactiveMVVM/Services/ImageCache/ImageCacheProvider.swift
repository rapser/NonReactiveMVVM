//
//  ImageCacheProvider.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class ImageCacheProvider: ImageCache {
    //MARK: - Private
    private var cache = [String: UIImage]()
    private let network: Network
    
    //MARK: - Lifecycle
    required init(network: Network) {
        self.network = network
    }
    
    //MARK: - Public
    func image(url: String, success: (UIImage) -> Void, failure: (Error) -> Void) -> NetworkCancelable? {
        if let existing = self.cache[url] {
            success(existing)
            print("cached")
            return nil
        }
        
        let request = NetworkRequest(method: .GET, url: url)
//        return self.network.makeRequest(request: request, success: { (data) in
//            guard let `self` = self else { return }
//
//            guard let image = UIImage(data: data) else {
//                failure(ImageCacheError.InvalidResponse)
//                return
//            }
//            self.cache[url] = image
//            success(image)
//        }, failure: failure)
        return nil

    }
    func hasImageFor(url: String) -> Bool {
        return (self.cache[url] != nil)
    }
    func cachedImage(url: String, or: UIImage?) -> UIImage? {
        return self.cache[url] ?? or
    }
    func clearCache() { self.cache = [String: UIImage]() }
}
