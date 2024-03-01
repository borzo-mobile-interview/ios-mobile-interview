//
//  Order.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public struct Order {
    public let orderId: Int
    public let address: String
    public let date: String
    
    public init(
        orderId: Int,
        address: String,
        date: String
    ) {
        self.orderId = orderId
        self.address = address
        self.date = date
    }
}

extension Order: Equatable {
    public static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.orderId == rhs.orderId
    }
}

extension Order: Hashable {
    public func hash(into hasher: inout Hasher)  {
        hasher.combine(self.orderId)
    }
}

extension Order {
    static func from(dto: OrderDto) -> Order {
        Order(
            orderId: dto.orderId,
            address: dto.address,
            date: dto.date
        )
    }
}
