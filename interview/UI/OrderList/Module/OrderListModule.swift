//
//  OrderListModule.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

public struct OrderListModule {
    public let viewController: UIViewController & DisposeBag
    public let moduleInput: OrderListModuleInput
    
    public init(
        viewController: UIViewController & DisposeBag,
        moduleInput: OrderListModuleInput
    ) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
