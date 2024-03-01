//
//  OrderListModuleAssembly.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

final class OrderListModuleAssembly: OrderListModuleAssemblyProtocol {
    private let container: DIContainerProtocol
    
    
    // MARK: - Init
    init(container: DIContainerProtocol) {
        self.container = container
    }
    
    
    // MARK: - OrderListModuleAssemblyProtocol
    func module(moduleSeed: OrderListModuleSeed) -> OrderListModule {
        // ViewModel
        let viewModel = OrderListViewModel(
            initialState: OrderListViewState.empty(),
            ordersProvider: container.ordersProvider
        )
        
        // ViewController
        let viewController = OrderListViewController(
            viewModel: viewModel,
            viewFactory: { vm in OrderListView(viewModel: vm) }
        )
        
        return OrderListModule(
            viewController: viewController,
            moduleInput: viewModel
        )
    }
}
