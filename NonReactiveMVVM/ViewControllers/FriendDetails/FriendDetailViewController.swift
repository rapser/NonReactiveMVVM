//
//  FriendDetailViewController.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private var backingView: UIView!
    @IBOutlet private var friendImageView: RoundedImageView!
    @IBOutlet private var friendNameLabel: UILabel!
    @IBOutlet private var friendEmailLabel: UILabel!
    @IBOutlet private var friendAboutLabel: UITextView!
    
    //MARK: - Private
    private var viewModel: FriendDetailViewModel!
    
    //MARK: - Lifecycle
    convenience init(viewModel: FriendDetailViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor.randomPastelColor()
        self.backingView.backgroundColor = color
        self.friendImageView.borderColor = color
        
        self.viewModelDidUpdate()
        self.bindToViewModel()
    }
    
    //MARK: - ViewModel
    private func bindToViewModel() {
        self.viewModel.didUpdate = { [weak self] in
            self?.viewModelDidUpdate()
        }
        self.viewModel.didError = { [weak self] error in
            self?.viewModelDidError(error: error)
        }
    }
    private func viewModelDidUpdate() {
        self.friendImageView.image = self.viewModel.image
        self.friendNameLabel.text = self.viewModel.fullName
        self.friendEmailLabel.text = self.viewModel.email
        self.friendAboutLabel.text = self.viewModel.about
    }
    private func viewModelDidError(error: Error) {
        UIAlertView(title: "Error", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
    }
}

extension FriendDetailViewController: Themeable {
    var navigationBarBackgroundColor: UIColor? { return self.backingView?.backgroundColor }
    var navigationBarTintColor: UIColor? { return .white }
}
