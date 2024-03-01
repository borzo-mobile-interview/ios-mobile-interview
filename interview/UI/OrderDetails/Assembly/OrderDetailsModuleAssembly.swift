//
//  OrderDetailsModuleAssembly.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

final class OrderDetailsModuleAssembly: OrderDetailsModuleAssemblyProtocol {
    private let container: DIContainerProtocol
    
    
    // MARK: - Init
    init(container: DIContainerProtocol) {
        self.container = container
    }
    
    
    // MARK: - OrderDetailsModuleAssemblyProtocol
    func module(moduleSeed: OrderDetailsModuleSeed) -> OrderDetailsModule {
        // ViewModel
        let viewModel = OrderDetailsViewModel(
            initialState: OrderDetailsViewState.empty(),
            orderId: moduleSeed.orderId,
            ordersProvider: container.ordersProvider
        )
        
        // ViewController
        let viewController = OrderDetailsViewController(
            viewModel: viewModel,
            viewFactory: { vm in OrderDetailsView(viewModel: vm) }
        )
        
        return OrderDetailsModule(
            viewController: viewController,
            moduleInput: viewModel
        )
    }
}
