//
//  UIColor+Extensions.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomPastelColor(withMixedColor mixColor: UIColor? = nil) -> UIColor {
        let randomColorGenerator = { ()-> CGFloat in
            CGFloat(arc4random() % 256 ) / 256
        }
        
        var red: CGFloat = randomColorGenerator()
        var green: CGFloat = randomColorGenerator()
        var blue: CGFloat = randomColorGenerator()
        
        // Mix the color
        if let mixColor = mixColor {
            var mixRed: CGFloat = 0, mixGreen: CGFloat = 0, mixBlue: CGFloat = 0;
            mixColor.getRed(&mixRed, green: &mixGreen, blue: &mixBlue, alpha: nil)
            
            red = (red + mixRed) / 2;
            green = (green + mixGreen) / 2;
            blue = (blue + mixBlue) / 2;
        }
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
