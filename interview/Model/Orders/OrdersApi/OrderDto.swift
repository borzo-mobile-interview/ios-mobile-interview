//
//  OrderDto.swift
//  interview
//
//  Created by Boris Bengus on 19/02/2024.
//

import Foundation

public struct OrderDto: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case address
        case date
    }
}
