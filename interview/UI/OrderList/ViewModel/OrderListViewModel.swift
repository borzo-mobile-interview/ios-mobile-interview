//
//  OrderListViewModel.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

class OrderListViewModel:
    ViewModel
<
    OrderListViewState,
    OrderListViewModel.ViewAction,
    OrderListViewModel.Eff
>,
    OrderListModuleInput
{
    private let ordersProvider: OrdersProviderProtocol
    
    private var isFullUpdateInProgress = false
    
    
    // MARK: - Init
    init(
        initialState: OrderListViewState,
        ordersProvider: OrdersProviderProtocol
    ) {
        self.ordersProvider = ordersProvider
        
        super.init(initialState: initialState)
    }
    
    
    // MARK: - Lifecycle
    override func onViewDidFirstAppear() {
        super.onViewDidFirstAppear()
        requestUpdate()
    }
    
    
    // MARK: - ViewActions
    override func onViewAction(_ action: ViewAction) {
        switch action {
        case .requestUpdate:
            requestUpdate()
        case .orderItemTap(let orderItem):
            orderItemTap(orderItem: orderItem)
        }
    }
    
    private func requestUpdate() {
        isFullUpdateInProgress = true
        reload()
        
        ordersProvider.updateOrders { [weak self] result in
            guard let self else { return }
            
            self.isFullUpdateInProgress = false
            reload()
            if case .failure(let error) = result {
                self.publishEffect(.showError(errorText: error.localizedDescription))
            }
        }
    }
    
    private func orderItemTap(orderItem: OrderListViewState.OrderViewItem) {
        onAction?(.openOrderDetails(orderId: orderItem.orderId))
    }
    
    /// Call this method any time you want to actualize a ViewState
    private func reload() {
        let orders = ordersProvider.getAllOrders()
        let state = OrderListViewState(
            isRefreshControlRefreshing: isFullUpdateInProgress,
            orders: orders.map { OrderListViewState.OrderViewItem.from(order: $0) }
        )
        
        self.publishState(state)
    }
    
    
    // MARK: - OrderListModuleInput
    var onAction: ((OrderListModuleAction) -> Void)?
}

extension OrderListViewModel {
    enum ViewAction {
        case requestUpdate
        case orderItemTap(orderItem: OrderListViewState.OrderViewItem)
    }
}

extension OrderListViewModel {
    enum Eff {
        case showError(errorText: String)
    }
}
