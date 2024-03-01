//
//  OrdersProviderProtocol.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public protocol OrdersProviderProtocol {
    func getAllOrders() -> [Order]
    
    func getOrder(byId orderId: Int) -> Order?
    
    func updateOrders(completion: @escaping (Result<Void, OrdersError>) -> Void)
}
