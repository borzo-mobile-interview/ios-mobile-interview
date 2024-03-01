//
//  DIContainerProtocol.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

protocol DIContainerProtocol {
    // MARK: Services
    var ordersProvider: OrdersProviderProtocol { get }
    
    // MARK: UI modules assemblies
    func getRootModuleAssembly() -> RootModuleAssemblyProtocol
    
    func getOrderListModuleAssembly() -> OrderListModuleAssemblyProtocol
    
    func getOrderDetailsModuleAssembly() -> OrderDetailsModuleAssemblyProtocol
}
