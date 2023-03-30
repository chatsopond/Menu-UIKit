//
//  InventoryItemDetailViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class InventoryItemDetailViewController: UIViewController {
  private let viewModel: ItemDetailViewModel
  private let detailView: InventoryItemDetailView

  init(viewModel: ItemDetailViewModel) {
    self.viewModel = viewModel
    self.detailView = InventoryItemDetailView()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view = detailView
    navigationController?.setNavigationBarHidden(true, animated: false)
    detailView.setTableViewDataSourceDelegate(dataSourceDelegate: self)
  }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension InventoryItemDetailViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.cellViewModels.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellViewModel = viewModel.cellViewModel(at: indexPath)
    let cell = tableView.dequeueReusableCell(
      withIdentifier: cellViewModel.reuseIdentifier,
      for: indexPath)
    if let cell = cell as? InventoryItemDetailCell {
      cell.viewModel = cellViewModel
    }

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let cellViewModel = viewModel.cellViewModel(at: indexPath) as InventoryItemDetailCellViewModel
    return cellViewModel.heightWithBottomPadding(tableView)
  }
}
