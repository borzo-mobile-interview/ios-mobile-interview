//
//  OrdersError.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public enum OrdersError: LocalizedError {
    case cantUpdateOrders(reason: Error?)
    
    public var errorDescription: String? {
        // Skip localization because of Demo
        switch self {
        case .cantUpdateOrders(_):
            return "Can't update orders, please try again"
        }
    }
}
