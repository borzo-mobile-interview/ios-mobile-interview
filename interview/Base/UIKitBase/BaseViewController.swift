//
//  BaseViewController.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController,
                               DisposeBag,
                               DisposeBagHolder
{
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 14.0, *) {
            self.navigationItem.backButtonDisplayMode = .minimal
        } else {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
    // MARK: - DisposeBag
    public let disposeBag: DisposeBag = DisposeBagImpl()
}
