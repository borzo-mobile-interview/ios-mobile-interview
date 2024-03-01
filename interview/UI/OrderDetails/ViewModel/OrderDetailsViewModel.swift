//
//  OrderDetailsViewModel.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

class OrderDetailsViewModel:
    ViewModel
<
    OrderDetailsViewState,
    OrderDetailsViewModel.ViewAction,
    OrderDetailsViewModel.Eff
>,
    OrderDetailsModuleInput
{
    private let orderId: Int
    private let ordersProvider: OrdersProviderProtocol
    
    
    // MARK: - Init
    init(
        initialState: OrderDetailsViewState,
        orderId: Int,
        ordersProvider: OrdersProviderProtocol
    ) {
        self.orderId = orderId
        self.ordersProvider = ordersProvider
        
        super.init(initialState: initialState)
    }
    
    
    // MARK: - Lifecycle
    override func onViewWillAppear() {
        super.onViewWillAppear()
        reload()
    }
    
    
    private func reload() {
        let state: OrderDetailsViewState
        if let order = ordersProvider.getOrder(byId: orderId) {
            state = .order(viewItem: OrderDetailsViewState.OrderViewItem.from(order: order))
        } else {
            state = .empty
        }
        
        self.publishState(state)
    }
    
    
    // MARK: - OrderDetailsModuleInput
    var onAction: ((OrderDetailsModuleAction) -> Void)?
}

extension OrderDetailsViewModel {
    enum ViewAction {
        
    }
}

extension OrderDetailsViewModel {
    enum Eff {
        
    }
}
