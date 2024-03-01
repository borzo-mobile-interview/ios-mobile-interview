//
//  OrdersApi.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public final class OrdersApi: OrdersApiProtocol {
    private let callbackQueue = DispatchQueue.main
    private lazy var jsonDecoder = JSONDecoder()
    
    
    // MARK: - OrdersApiProtocol
    public func requestOrders(
        limit: Int,
        completion: @escaping (Result<OrdersResponseDto, OrdersApiError>) -> Void
    ) {
        var request = URLRequest(url: URL(string: "https://externalwebhooks.borzo.net/mobile-interview-api.php?limit=\(limit)")!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self else { return }
            
            if let error = error {
                callbackQueue.async {
                    completion(.failure(OrdersApiError.generalNetworkError(reason: error)))
                }
                return
            }
            guard let response = response as? HTTPURLResponse else {
                callbackQueue.async {
                    completion(.failure(OrdersApiError.generalNetworkError(reason: nil)))
                }
                return
            }
            
            switch response.statusCode {
            case 200...299:
                if
                    let data = data,
                    let responseDto = try? jsonDecoder.decode(OrdersResponseDto.self, from: data)
                {
                    #if DEBUG
                    // Just for testing purposes delay successful response for a second
                    callbackQueue.asyncAfter(deadline: .now() + .seconds(1)) {
                        completion(.success(responseDto))
                    }
                    #else
                    callbackQueue.async {
                        completion(.success(responseDto))
                    }
                    #endif
                } else {
                    callbackQueue.async {
                        completion(.failure(OrdersApiError.invalidResponse))
                    }
                }
            default:
                callbackQueue.async {
                    completion(.failure(OrdersApiError.invalidStatus(status: response.statusCode)))
                }
            }
        }
        task.resume()
    }
}
