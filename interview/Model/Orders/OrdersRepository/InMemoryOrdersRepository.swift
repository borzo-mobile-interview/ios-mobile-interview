//
//  InMemoryOrdersRepository.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

final class InMemoryOrdersRepository: OrdersRepositoryProtocol {
    private var orders = [Order]()
    
    
    // MARK: - Init
    public init() { }
    
    
    // MARK: - OrdersRepositoryProtocol
    func getAllOrders() -> [Order] {
        return orders
    }
    
    func getOrder(byId orderId: Int) -> Order? {
        return orders.first(where: { $0.orderId == orderId })
    }
    
    func saveOrders(_ orders: [Order], completion: @escaping (Result<Void, Error>) -> Void) {
        self.orders = orders
        completion(.success(()))
    }
}
