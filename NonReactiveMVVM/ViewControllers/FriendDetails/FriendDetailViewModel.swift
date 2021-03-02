//
//  FriendDetailViewModel.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class FriendDetailViewModel {
    //MARK: - Private
    private let friend: Friend
    private let imageCache: ImageCache
    private var imageCacheCancellable: NetworkCancelable?
    
    //MARK: - Lifecycle
    init(friend: Friend, imageCache: ImageCache) {
        self.friend = friend
        self.imageCache = imageCache
        self.loadLargeImage()
    }
    deinit {
        self.imageCacheCancellable?.cancel()
    }
    
    //MARK: - Events
    var didError: ((Error) -> Void)?
    var didUpdate: (() -> Void)?
    
    //MARK: - Properties
    var fullName: String { return "\(self.friend.firstName.capitalized) \(self.friend.lastName.capitalized)" }
    private(set) lazy var image: UIImage? = self.imageCache.cachedImage(
        url: self.friend.image_large,
        or: self.imageCache.cachedImage(
            url: self.friend.image_small,
            or: UIImage(named: "default")
        )
    )
    var email: String { return self.friend.email }
    var about: String { return self.friend.about.capitalized }
    
    //MARK: - Actions
    private func loadLargeImage() {
        if (self.imageCache.hasImageFor(url: self.friend.image_large)) { return }
        
        self.imageCacheCancellable = self.imageCache.image(
            url: self.friend.image_large,
            success: { image in
                self.image = image
                self.didUpdate?()
            },
            failure: { error in
                self.didError?(error)
            }
        )
    }
}
