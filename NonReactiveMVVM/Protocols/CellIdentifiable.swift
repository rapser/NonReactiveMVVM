//
//  CellIdentifiable.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import ObjectiveC
import UIKit

protocol CellIdentifiable: class {
    var uniqueId: IndexPath? { get set }
}

private struct AssociatedKeys {
    static var UniqueID = "UniqueID"
}

extension UITableViewCell: CellIdentifiable {
    
    var uniqueId: IndexPath? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.UniqueID) as? IndexPath }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.UniqueID, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.UniqueID, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

}
