//
//  UIImage+Extensions.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

extension UIImage {
    static func fromColor(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

