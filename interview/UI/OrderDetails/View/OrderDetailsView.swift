//
//  OrderDetailsView.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit
import PinLayout

final class OrderDetailsView: MvvmUIKitView
<
    OrderDetailsViewModel,
    OrderDetailsViewState,
    OrderDetailsViewModel.ViewAction,
    OrderDetailsViewModel.Eff
> {
    // MARK: - Subviews
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = Design.Colors.primaryText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = Design.Colors.primaryText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = Design.Colors.primaryText
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - Init
    override init(viewModel: OrderDetailsViewModel) {
        super.init(viewModel: viewModel)
        
        self.backgroundColor = Design.Colors.defaultBackground
        addSubview(idLabel)
        addSubview(dateLabel)
        addSubview(addressLabel)
    }
    
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        self.pin.width(size.width)
        return layout()
    }
    
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        setNeedsLayout()
    }
    
    
    // MARK: - Layout
    @discardableResult
    private func layout() -> CGSize {
        idLabel.pin
            .top(pin.safeArea + Design.Metrics.verticalGap)
            .horizontally(Design.Metrics.horizontalGap)
            .sizeToFit(.width)
        
        dateLabel.pin
            .below(of: idLabel)
            .marginTop(Design.Metrics.verticalGap)
            .horizontally(Design.Metrics.horizontalGap)
            .sizeToFit(.width)
        
        addressLabel.pin
            .below(of: dateLabel)
            .marginTop(Design.Metrics.verticalGap)
            .horizontally(Design.Metrics.horizontalGap)
            .sizeToFit(.width)
        
        return frame.size
    }
    
    
    // MARK: - State and effects
    override func onState(_ state: OrderDetailsViewState) {
        super.onState(state)
        
        switch state {
        case .empty:
            idLabel.text = nil
            dateLabel.text = nil
            addressLabel.text = nil
        case .order(let viewItem):
            idLabel.text = viewItem.orderIdText
            dateLabel.text = viewItem.dateText
            addressLabel.text = viewItem.addressText
        }
        idLabel.isHidden = state.isEmpty
        dateLabel.isHidden = state.isEmpty
        addressLabel.isHidden = state.isEmpty
        
        setNeedsLayout()
    }
}
