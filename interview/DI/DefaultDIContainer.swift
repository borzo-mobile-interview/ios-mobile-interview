//
//  DefaultDIContainer.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

final class DefaultDIContainer: DIContainerProtocol {
    init() { }
    
    
    // MARK: - DIContainerProtocol
    // MARK: Services
    private(set) lazy var ordersProvider: OrdersProviderProtocol = {
        return OrdersProvider(
            ordersRepository: InMemoryOrdersRepository(),
            ordersApi: OrdersApi()
            // In case you have network issues, uncomment this line below
//             ordersApi: FakeOrdersApi()
        )
    }()
    
    // MARK: UI modules assemblies
    func getRootModuleAssembly() -> RootModuleAssemblyProtocol {
        return RootModuleAssembly(container: self)
    }
    
    func getOrderListModuleAssembly() -> OrderListModuleAssemblyProtocol {
        return OrderListModuleAssembly(container: self)
    }
    
    func getOrderDetailsModuleAssembly() -> OrderDetailsModuleAssemblyProtocol {
        return OrderDetailsModuleAssembly(container: self)
    }
}
