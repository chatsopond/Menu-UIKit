//
//  ImageAndBackgroundView.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit
import Anchorage

class ImageAndBackgroundView: UIView {
  let customImageView = UIImageView()
  let customBackgroundView = UIImageView()
  private let viewModel: ImageAndBackgroundViewModel

  init(viewModel: ImageAndBackgroundViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    setupViews()
    styleViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    addSubview(customBackgroundView)
    addSubview(customImageView)
  }

  private func styleViews() {
    customBackgroundView.image = viewModel.backgroundImage
    customImageView.image = viewModel.image
    customImageView.contentMode = .scaleAspectFit
  }

  private func setupConstraints() {
    customBackgroundView.edgeAnchors == edgeAnchors
    customImageView.edgeAnchors == edgeAnchors
  }
}

struct ImageAndBackgroundViewModel {
  let image: UIImage
  let backgroundImage: UIImage
}
