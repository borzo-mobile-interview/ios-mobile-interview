//
//  OrdersRepositoryProtocol.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public protocol OrdersRepositoryProtocol {
    func getAllOrders() -> [Order]
    
    func getOrder(byId orderId: Int) -> Order?
    
    func saveOrders(
        _ orders: [Order],
        completion: @escaping (Result<Void, Error>) -> Void
    )
}
