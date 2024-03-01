//
//  OrderListView.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import Foundation
import UIKit
import PinLayout

final class OrderListView: MvvmUIKitView
<
    OrderListViewModel,
    OrderListViewState,
    OrderListViewModel.ViewAction,
    OrderListViewModel.Eff
>,
    UITableViewDataSource,
    UITableViewDelegate
{
    private let OrderListTableViewCellIdentifier = "OrderListTableViewCellIdentifier"
    
    
    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .none
        tableView.alwaysBounceVertical = true
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    private lazy var orderPrototypeCell = OrderListTableViewCell(style: .default, reuseIdentifier: nil)
    private lazy var refreshControl: UIRefreshControl = UIRefreshControl()
    
    
    // MARK: - Init
    override init(viewModel: OrderListViewModel) {
        super.init(viewModel: viewModel)
        
        self.backgroundColor = Design.Colors.defaultBackground
        addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OrderListTableViewCell.self, forCellReuseIdentifier: OrderListTableViewCellIdentifier)
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(onRefreshControlRefresh(_:)), for: UIControl.Event.valueChanged)
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
        tableView.pin
            .top(pin.safeArea.top)
            .horizontally()
            .bottom()
        return frame.size
    }
    
    
    // MARK: - Control's Actions
    @objc
    private func onRefreshControlRefresh(_ sender: AnyObject) {
        viewModel.sendViewAction(.requestUpdate)
    }
    
    
    // MARK: - State and effects
    override func onState(_ state: OrderListViewState) {
        super.onState(state)
        
        if state.isRefreshControlRefreshing && !refreshControl.isRefreshing {
            refreshControl.beginRefreshing()
            let contentOffset = CGPoint(x: 0, y: -refreshControl.frame.height)
            tableView.setContentOffset(contentOffset, animated: true)
        } else if !state.isRefreshControlRefreshing && refreshControl.isRefreshing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.refreshControl.endRefreshing()
            }
        }
        tableView.reloadData()
        
        setNeedsLayout()
    }
    
    override func onEffect(_ eff: OrderListViewModel.Eff) {
        super.onEffect(eff)
        // handled in ViewController
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCellIdentifier) as! OrderListTableViewCell
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.state.orders[indexPath.row]
        let constraintSize = CGSize(width: tableView.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        orderPrototypeCell.prepareForReuse()
        orderPrototypeCell.setViewItem(item)
        return orderPrototypeCell.sizeThatFits(constraintSize).height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = viewModel.state.orders[indexPath.row]
        guard let cell = cell as? OrderListTableViewCell else { return }
        cell.setViewItem(item)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.state.orders[indexPath.row]
        
        viewModel.sendViewAction(.orderItemTap(orderItem: item))
    }
}
