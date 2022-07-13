//
//  UIFont+Extension.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit

private extension UIFont {
    
    class func poppins(ofSize size: CGFloat) -> UIFont {
        guard let poppins = UIFont(name: "Poppins-Regular", size: size) else {
            preconditionFailure(
                "Unable to access font"
            )
        }
        return poppins
    }

    class func poppinsBold(ofSize size: CGFloat) -> UIFont {
        guard let poppinsBold = UIFont(name: "Poppins-Light", size: size) else {
            preconditionFailure(
                "Unable to access font"
            )
        }
        return poppinsBold
    }
}

extension UIFont {
    
    class func regular(ofSize size: CGFloat) -> UIFont {
        .poppins(ofSize: size)
    }

    class func bold(ofSize size: CGFloat) -> UIFont {
        .poppinsBold(ofSize: size)
    }

}

