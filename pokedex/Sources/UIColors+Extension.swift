//
//  UIColors+Extension.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit

extension UIColor {
    
    class var rock: UIColor { UIColor(hex: "B69E31") }
    
    class var ghost: UIColor { UIColor(hex: "70559B") }
    
    class var steel: UIColor { UIColor(hex: "B7B9D0") }
    
    class var water: UIColor { UIColor(hex: "6493EB") }
    
    class var grass: UIColor { UIColor(hex: "74CB48") }
    
    class var psychic: UIColor { UIColor(hex: "FB5584") }
    
    class var ice: UIColor { UIColor(hex: "9AD6DF") }
    
    class var dark: UIColor { UIColor(hex: "75574C") }
    
    class var fairy: UIColor { UIColor(hex: "CC6FA9") }
    
    class var normal: UIColor { UIColor(hex: "AAA67F") }
    
    class var fighting: UIColor { UIColor(hex: "C12239") }
    
    class var flying: UIColor { UIColor(hex: "A891EC") }
    
    class var poison: UIColor { UIColor(hex: "A43E9E") }
    
    class var ground: UIColor { UIColor(hex: "DEC16B") }
    
    class var bug: UIColor { UIColor(hex: "A7B723") }
    
    class var fire: UIColor { UIColor(hex: "F57D31") }
    
    class var eletric: UIColor { UIColor(hex: "F9CF30") }
    
    class var dragon: UIColor { UIColor(hex: "7037FF") }
    
    class var darkGray: UIColor { UIColor(hex: "212121") }
    
    class var mediumGray: UIColor { UIColor(hex: "666666") }
    
    class var lightGray: UIColor { UIColor(hex: "E0E0E0") }
    
    class var white: UIColor { UIColor(hex: "FFFFFF") }
    
    class var background: UIColor { UIColor(hex: "F7F7F7") }

}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

