//
//  DisposeBag.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation

public protocol DisposeBag {
    func addDisposable(_ anyObject: AnyObject)
}

public protocol DisposeBagHolder {
    var disposeBag: DisposeBag { get }
}

// Default `DisposeBag` implementation
public extension DisposeBag where Self: DisposeBagHolder {
    func addDisposable(_ anyObject: AnyObject) {
        disposeBag.addDisposable(anyObject)
    }
}

// Non thread safe `DisposeBag` implementation
public final class DisposeBagImpl: DisposeBag {
    private var disposables: [AnyObject] = []
    
    public init() {
        
    }
    
    public func addDisposable(_ anyObject: AnyObject) {
        disposables.append(anyObject)
    }
}
