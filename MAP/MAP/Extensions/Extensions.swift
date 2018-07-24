//
//  Extensions.swift
//  MAP
//
//  Created by killi8n on 2018. 7. 18..
//  Copyright © 2018년 killi8n. All rights reserved.
//

import Foundation
import UIKit

class Extensions {
    
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState, radius: CGFloat) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: forState)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex: Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct FlatColor {
        struct Gray {
            static let Gray1 = UIColor(netHex: 0xF1F3F5)
            static let Gray4 = UIColor(netHex: 0xCEd4DA)
            static let Gray6 = UIColor(netHex: 0x868E96)
        }
        
        struct Red {
            static let Red4 = UIColor(netHex: 0xFF8787)
        }
        
        struct Blue {
            static let Blue5 = UIColor(netHex: 0x339af0)
            static let Blue6 = UIColor(netHex: 0x228be6)
            static let Blue8 = UIColor(netHex: 0x1971c2)
        }
        
        struct Green {
            static let Green8 = UIColor(netHex: 0x2f9e44)
        }
    }
}

extension UIView {
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

