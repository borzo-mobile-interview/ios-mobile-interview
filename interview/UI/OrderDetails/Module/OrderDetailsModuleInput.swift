//
//  OrderDetailsModuleInput.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public enum OrderDetailsModuleAction {
    
}

public protocol OrderDetailsModuleInput: AnyObject {
    var onAction: ((OrderDetailsModuleAction) -> Void)? { get set }
}
