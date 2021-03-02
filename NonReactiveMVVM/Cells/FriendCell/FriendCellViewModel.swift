//
//  FriendCellViewModel.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class FriendCellViewModel {
    //MARK: - Private
    private let friend: Friend
    private let imageCache: ImageCache
    private var imageCacheCancellable: NetworkCancelable?
    private var restrictedTo: IndexPath?
    
    //MARK: - Lifecycle
    init(friend: Friend, imageCache: ImageCache) {
        self.friend = friend
        self.imageCache = imageCache
    }
    deinit {
        self.imageCacheCancellable?.cancel()
    }
    
    //MARK: - Events
    var didError: ((Error) -> Void)?
    var didUpdate: ((FriendCellViewModel) -> Void)?
    var didSelectFriend: ((Friend) -> Void)?
    
    //MARK: - Properties
    var fullName: String { return "\(self.friend.firstName.capitalized) \(self.friend.lastName.capitalized)" }
    private(set) var image: UIImage?
    
    //MARK: - Actions
    func allowedAccess(object: CellIdentifiable) -> Bool {
        guard
            let restrictedTo = self.restrictedTo,
            let uniqueId = object.uniqueId
            else { return true }
        
        return uniqueId as IndexPath == restrictedTo
    }
    func loadThumbnailImage() {
        guard self.image == nil else { return } //ignore if we already have an image
        guard self.imageCacheCancellable == nil else { return } //ignore if we are already fetching
        
        self.imageCacheCancellable = self.imageCache.image(
            url: self.friend.image_small,
            success: { [weak self] image in
                guard let `self` = self else { return }
                
                self.image = image
                self.didUpdate?(self)
            },
            failure: { [weak self] error in
                self?.didError?(error)
            }
        )
    }
}

extension FriendCellViewModel: CellRepresentable {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
    }
    func dequeueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        cell.uniqueId = indexPath
        self.restrictedTo = indexPath
        cell.setup(viewModel: self)
        return cell
    }
    func cellSelected() {
        self.didSelectFriend?(self.friend)
    }
}
