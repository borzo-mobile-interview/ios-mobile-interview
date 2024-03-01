//
//  OrderDetailsModule.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

public struct OrderDetailsModule {
    public let viewController: UIViewController & DisposeBag
    public let moduleInput: OrderDetailsModuleInput
    
    public init(
        viewController: UIViewController & DisposeBag,
        moduleInput: OrderDetailsModuleInput
    ) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
