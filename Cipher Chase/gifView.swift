//
//  gifView.swift
//  Cipher Chase
//
//  Created by Lujain Alaydie on 25/11/2023.
//

import SwiftUI
import FLAnimatedImage

struct GIFView: UIViewRepresentable {
  private var type: URLType

  init(type: URLType) {
    self.type = type
  }

  private let imageView: FLAnimatedImageView = {
    let imageView = FLAnimatedImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 24
    imageView.layer.masksToBounds = true
    return imageView
  }()

  private let activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicator
  }()
}

extension GIFView {
  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: .zero)

    view.addSubview(activityIndicator)
    view.addSubview(imageView)

    imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    activityIndicator.startAnimating()
    guard let url = type.url else { return }

    DispatchQueue.global().async {
      if let data = try? Data(contentsOf: url) {
        let image = FLAnimatedImage(animatedGIFData: data)

        DispatchQueue.main.async {
          activityIndicator.stopAnimating()
          imageView.animatedImage = image
        }
      }
    }
  }
}
