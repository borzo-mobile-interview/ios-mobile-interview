//
//  OrderDetailsViewState.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

enum OrderDetailsViewState: Equatable {
    case empty
    case order(viewItem: OrderViewItem)
    
    var isEmpty: Bool {
        self == .empty
    }
    
    static func empty() -> Self {
        return .empty
    }

    struct OrderViewItem: Equatable {
        let orderId: Int
        let orderIdText: String
        let dateText: String
        let addressText: String
        
        static func from(order: Order) -> OrderDetailsViewState.OrderViewItem {
            OrderDetailsViewState.OrderViewItem(
                orderId: order.orderId,
                orderIdText: "#\(order.orderId)",
                dateText: order.date,
                addressText: order.address
            )
        }
    }
}
