//
//  RootModuleInput.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

public enum RootModuleAction {
    
}

public protocol RootModuleInput: AnyObject {
    var onAction: ((RootModuleAction) -> Void)? { get set }
    
    func start(navigationController: UINavigationController)
}
