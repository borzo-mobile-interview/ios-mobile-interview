//
//  OrdersProvider.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public final class OrdersProvider: OrdersProviderProtocol {
    private let callbackQueue = DispatchQueue.main
    private let ordersRepository: OrdersRepositoryProtocol
    private let ordersApi: OrdersApiProtocol
    
    
    // MARK: - Init
    public init(
        ordersRepository: OrdersRepositoryProtocol,
        ordersApi: OrdersApiProtocol
    ) {
        self.ordersRepository = ordersRepository
        self.ordersApi = ordersApi
    }
    
    
    // MARK: - OrdersProviderProtocol
    public func getAllOrders() -> [Order] {
        return ordersRepository.getAllOrders()
    }
    
    public func getOrder(byId orderId: Int) -> Order? {
        return ordersRepository.getOrder(byId: orderId)
    }
    
    public func updateOrders(completion: @escaping (Result<Void, OrdersError>) -> Void) {
        ordersApi.requestOrders(limit: 20) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let responseDto):
                let orders = responseDto.orders.map {
                    Order.from(dto: $0)
                }
                self.ordersRepository.saveOrders(orders) { [weak self] result in
                    guard let self else { return }
                    switch result {
                    case .success(()):
                        self.callbackQueue.async {
                            completion(.success(()))
                        }
                    case .failure(let error):
                        self.callbackQueue.async {
                            completion(.failure(OrdersError.cantUpdateOrders(reason: error)))
                        }
                    }
                }
            case .failure(let error):
                self.callbackQueue.async {
                    completion(.failure(OrdersError.cantUpdateOrders(reason: error)))
                }
            }
        }
    }
}
