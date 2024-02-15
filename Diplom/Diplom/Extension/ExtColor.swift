//
//  ExtColor.swift
//  Diplom
//
//  Created by Katerina on 13/02/2024.
//

import Foundation
import UIKit

extension UIColor {
    
    static var mealOrange: UIColor {
        return UIColor.init(rgb: 0xF5ec9e)
    }
    
    convenience init(rgb: UInt) {
           self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
        }
    
}
