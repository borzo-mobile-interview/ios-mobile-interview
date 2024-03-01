//
//  OrderDetailsModuleAssemblyProtocol.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public protocol OrderDetailsModuleAssemblyProtocol {
    func module(moduleSeed: OrderDetailsModuleSeed) -> OrderDetailsModule
}
