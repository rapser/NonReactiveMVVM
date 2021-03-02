//
//  FriendCell.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet private var friendNameLabel: UILabel!
    @IBOutlet private var friendImageView: UIImageView!
    
    //MARK: - Public
    func setup(viewModel: FriendCellViewModel) {
        guard viewModel.allowedAccess(object: self) else { return }
        
        self.friendNameLabel.text = viewModel.fullName
        self.friendImageView.image = viewModel.image ?? UIImage(named: "default")
        
        viewModel.didUpdate = self.setup
        
        viewModel.loadThumbnailImage()
    }
}
