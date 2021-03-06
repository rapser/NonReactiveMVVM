//
//  Navigation.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class Navigation {
    //MARK: - Private
    private let navigationController: UINavigationController
    private let application: Application
    
    //MARK: - Lifecycle
    init(window: UIWindow, navigationController: UINavigationController, application: Application) {
        self.application = application
        self.navigationController = navigationController
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    //MARK: - Public
    func start() {
        self.showFriendList()
    }
    
    //MARK: - Private
    private func showFriendList() {
        let viewModel = FriendsListViewModel(
            api: self.application.api,
            imageCache: self.application.imageCache
        )
        viewModel.didSelectFriend = { [weak self] friend in
            self?.showFriend(friend: friend)
        }
        
        let instance = FriendsListViewController(viewModel: viewModel)
        self.navigationController.pushViewController(instance, animated: false)
    }
    private func showFriend(friend: Friend) {
        let viewModel = FriendDetailViewModel(
            friend: friend,
            imageCache: self.application.imageCache
        )
        let instance = FriendDetailViewController(viewModel: viewModel)
        self.navigationController.pushViewController(instance, animated: true)
    }
}
