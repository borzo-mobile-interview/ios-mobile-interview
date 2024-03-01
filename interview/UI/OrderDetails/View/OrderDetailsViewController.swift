//
//  OrderDetailsViewController.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit

final class OrderDetailsViewController: MvvmUIKitViewController<
    OrderDetailsView,
    OrderDetailsViewModel,
    OrderDetailsViewState,
    OrderDetailsViewModel.ViewAction,
    OrderDetailsViewModel.Eff
> {
    // MARK: - State and effects
    override func onState(_ state: OrderDetailsViewState) {
        super.onState(state)
        switch state {
        case .empty:
            navigationItem.title = ""
        case .order(let viewItem):
            navigationItem.title = viewItem.orderIdText
        }
    }
}
