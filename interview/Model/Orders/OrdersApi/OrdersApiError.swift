//
//  OrdersApiError.swift
//  interview
//
//  Created by Boris Bengus on 19/02/2024.
//

import Foundation

public enum OrdersApiError: Error {
    case generalNetworkError(reason: Error?)
    case invalidStatus(status: Int)
    case invalidResponse
}
