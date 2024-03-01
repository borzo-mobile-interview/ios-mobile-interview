//
//  OrderListTableViewCell.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit
import PinLayout

final class OrderListTableViewCell: UITableViewCell {
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = Design.Colors.primaryText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = Design.Colors.primaryText
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = Design.Colors.primaryText
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var borderView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Design.Colors.border
        return view
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(idLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(borderView)
    }
    
    @available(*, unavailable, message: "Use another init()")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        return layout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        idLabel.text = nil
        dateLabel.text = nil
        addressLabel.text = nil
    }
    
    
    // MARK: - Layout
    @discardableResult
    private func layout() -> CGSize {
        idLabel.pin
            .top(Design.Metrics.verticalGap)
            .left(Design.Metrics.horizontalGap)
            .sizeToFit(.widthFlexible)
        
        dateLabel.pin
            .top(Design.Metrics.verticalGap)
            .after(of: idLabel)
            .marginStart(Design.Metrics.horizontalGap)
            .right(Design.Metrics.horizontalGap)
            .sizeToFit(.width)
        
        addressLabel.pin
            .below(of: visible([idLabel, dateLabel]))
            .marginTop(Design.Metrics.verticalGap / 2)
            .horizontally(Design.Metrics.horizontalGap)
            .sizeToFit(.width)
        
        borderView.pin
            .below(of: addressLabel)
            .marginTop(Design.Metrics.verticalGap)
            .horizontally()
            .height(Design.Metrics.borderWidth)
        
        contentView.pin
            .width(100%)
            .height(borderView.frame.maxY)
        
        return contentView.frame.size
    }
    
    
    // MARK: - Configure ViewState
    func setViewItem(_ viewItem: OrderListViewState.OrderViewItem) {
        idLabel.text = viewItem.orderIdText
        dateLabel.text = viewItem.dateText
        addressLabel.text = viewItem.addressText
    }
}
