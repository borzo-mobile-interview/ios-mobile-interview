//
//  OrderListViewState.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

struct OrderListViewState: Equatable {
    let isRefreshControlRefreshing: Bool
    let orders: [OrderViewItem]
    
    static func empty() -> Self {
        return OrderListViewState(
            isRefreshControlRefreshing: false,
            orders: []
        )
    }
    
    struct OrderViewItem: Equatable {
        let orderId: Int
        let orderIdText: String
        let dateText: String
        let addressText: String
        
        static func from(order: Order) -> OrderListViewState.OrderViewItem {
            OrderListViewState.OrderViewItem(
                orderId: order.orderId,
                orderIdText: "#\(order.orderId)",
                dateText: order.date,
                addressText: order.address
            )
        }
    }
}
