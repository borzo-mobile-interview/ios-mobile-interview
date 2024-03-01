//
//  OrderListModuleInput.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public enum OrderListModuleAction {
    case openOrderDetails(orderId: Int)
}

public protocol OrderListModuleInput: AnyObject {
    var onAction: ((OrderListModuleAction) -> Void)? { get set }
}
