//
//  RootModuleAssembly.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

final class RootModuleAssembly: RootModuleAssemblyProtocol {
    private let container: DIContainerProtocol
    
    
    // MARK: - Init
    init(container: DIContainerProtocol) {
        self.container = container
    }
    
    
    // MARK: - RootModuleAssemblyProtocol
    func module(moduleSeed: RootModuleSeed) -> RootModule {
        // Coordinator
        let coordinator = RootCoordinator(
            orderListModuleAssembly: container.getOrderListModuleAssembly(),
            orderDetailsModuleAssembly: container.getOrderDetailsModuleAssembly()
        )
        
        return RootModule(
            moduleInput: coordinator
        )
    }
}
