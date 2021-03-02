//
//  Application.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class Application {
    //MARK: - Dependencies
    private let window: UIWindow
    lazy var navigation: Navigation = Navigation(
        window: self.window,
        navigationController: NavigationController(),
        application: self
    )
    lazy var network = NetworkProvider(session: URLSession.shared)
    lazy var api: API = API(network: self.network)
    lazy var imageCache: ImageCache = ImageCacheProvider(network: self.network)
    
    //MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }
}
