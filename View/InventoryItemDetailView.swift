//
//  InventoryItemDetailView.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class InventoryItemDetailView: UIView {
  private let tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.tableFooterView = UIView()
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    return tableView
  }()

  private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

  init() {
    super.init(frame: .zero)
    setupUI()
    registerCells()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    setupViews()
    styleViews()
    setupConstraints()
  }

  private func setupViews() {
    blurView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(blurView)
    addSubview(tableView)
    sendSubviewToBack(blurView)
  }

  private func styleViews() {
    backgroundColor = .black.withAlphaComponent(0.1)
  }

  private func setupConstraints() {
    tableView.edgeAnchors == edgeAnchors
    blurView.edgeAnchors == edgeAnchors
  }

  private func registerCells() {
    tableView.register(
      TitleInventoryItemDetailCell.self,
      forCellReuseIdentifier: TitleInventoryItemDetailCell.reuseIdentifier)
    tableView.register(
      ImageInventoryItemDetailCell.self,
      forCellReuseIdentifier: ImageInventoryItemDetailCell.reuseIdentifier)
    tableView.register(
      RecipeInventoryItemDetailCell.self,
      forCellReuseIdentifier: RecipeInventoryItemDetailCell.reuseIdentifier)
  }

  func setTableViewDataSourceDelegate(dataSourceDelegate: UITableViewDataSource & UITableViewDelegate) {
    tableView.dataSource = dataSourceDelegate
    tableView.delegate = dataSourceDelegate
    tableView.reloadData()
  }
}
