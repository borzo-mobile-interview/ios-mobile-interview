//
//  OrderListViewController.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

final class OrderListViewController: MvvmUIKitViewController<
    OrderListView,
    OrderListViewModel,
    OrderListViewState,
    OrderListViewModel.ViewAction,
    OrderListViewModel.Eff
> {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Skip localization because of Demo
        navigationItem.title = "Orders"
    }
    
    
    // MARK: - State and effects
    override func onEffect(_ eff: OrderListViewModel.Eff) {
        super.onEffect(eff)
        switch eff {
        case .showError(let errorText):
            showError(errorText: errorText)
        }
    }
    
    private func showError(errorText: String) {
        // Skip localization because of Demo
        let alertController = UIAlertController(
            title: "Error",
            message: errorText,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in }
        ))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
