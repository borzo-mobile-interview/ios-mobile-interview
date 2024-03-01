//
//  UIImage+.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

public extension UIImage {
    class func maskedImageNamed(_ name: String, color: UIColor) -> UIImage? {
        guard let image = UIImage(named: name) else {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale)
        guard let c = UIGraphicsGetCurrentContext() else {
            return nil
        }
        image.draw(in: rect)
        c.setFillColor(color.cgColor)
        c.setBlendMode(.sourceAtop)
        c.fill(rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
