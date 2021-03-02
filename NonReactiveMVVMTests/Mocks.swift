//
//  Mocks.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit
@testable import NonReactiveMVVM

//The mocks here are not required for the test so we only need them to satisfy the compiler
class MockNetwork: Network {
    func makeRequest(request: NetworkRequest, success: ([String: Any]) -> Void, failure: (Error) -> Void) -> NetworkCancelable? { return nil }
    func makeRequest(request: NetworkRequest, success: (Data) -> Void, failure: (Error) -> Void) -> NetworkCancelable? { return nil }
}
class MockImageCache: ImageCache {
    convenience init() { self.init(network: MockNetwork()) }
    required init(network: Network) { }
    func image(url: String, success: (UIImage) -> Void, failure: (Error) -> Void) -> NetworkCancelable? { return nil }
    func hasImageFor(url: String) -> Bool { return false }
    func cachedImage(url: String, or: UIImage?) -> UIImage? { return nil }
    func clearCache() { }
}
