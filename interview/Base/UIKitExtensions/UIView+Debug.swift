//
//  UIView+Debug.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

public var debugColorCounter = 0
public let debugColors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange]

public extension UIView {
    func debugBorders() {
        #if DEBUG
        self.layer.borderWidth = 1
        self.layer.borderColor = debugColors[(debugColorCounter % debugColors.count)].cgColor
        debugColorCounter += 1
        #endif
    }
}
