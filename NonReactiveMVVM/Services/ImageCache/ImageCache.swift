//
//  ImageCache.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

enum ImageCacheError: Error, CustomStringConvertible {
    case InvalidResponse
    
    var description: String {
        switch self {
        case .InvalidResponse: return "Received an invalid response"
        }
    }
}

protocol ImageCache {
    init(network: Network)
    
    func image(url: String, success: (UIImage) -> Void, failure: (Error) -> Void) -> NetworkCancelable?
    func hasImageFor(url: String) -> Bool
    func cachedImage(url: String, or: UIImage?) -> UIImage?
    func clearCache()
}
