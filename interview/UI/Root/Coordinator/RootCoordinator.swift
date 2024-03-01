//
//  RootCoordinator.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

final class RootCoordinator: NavigationCoordinator,
                             RootModuleInput
{
    private let orderListModuleAssembly: OrderListModuleAssemblyProtocol
    private let orderDetailsModuleAssembly: OrderDetailsModuleAssemblyProtocol
    
    
    // MARK: - Init
    init(
        orderListModuleAssembly: OrderListModuleAssemblyProtocol,
        orderDetailsModuleAssembly: OrderDetailsModuleAssemblyProtocol
    ) {
        self.orderListModuleAssembly = orderListModuleAssembly
        self.orderDetailsModuleAssembly = orderDetailsModuleAssembly
        
        super.init()
    }
    
    
    // MARK: - Coordinator
    var onAction: ((RootModuleAction) -> Void)?
    
    func start(navigationController: UINavigationController) {
        let orderListModule = orderListModuleAssembly.module(moduleSeed: OrderListModuleSeed())
        orderListModule.moduleInput.onAction = { [weak self] action in
            switch action {
            case .openOrderDetails(let orderId):
                self?.openOrderDetails(orderId: orderId)
            }
        }
        let viewController = orderListModule.viewController
        
        configure(
            navigationController: navigationController,
            rootViewController: viewController
        )
        push(viewController, animated: false)
    }
    
    func openOrderDetails(orderId: Int) {
        let orderDetailsModule = orderDetailsModuleAssembly.module(moduleSeed: OrderDetailsModuleSeed(orderId: orderId))
        let viewController = orderDetailsModule.viewController
        
        push(viewController, animated: true)
    }
}
