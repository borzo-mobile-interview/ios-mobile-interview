//
//  OrdersApiProtocol.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public protocol OrdersApiProtocol {
    func requestOrders(
        limit: Int,
        completion: @escaping (Result<OrdersResponseDto, OrdersApiError>) -> Void
    )
}
