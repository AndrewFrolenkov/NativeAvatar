//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Андрей Фроленков on 24.05.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  private let imageView: UIImageView = {
    let view = UIImageView()
    view.image = .init(systemName: "person.crop.circle.fill")
    view.tintColor = .gray
    return view
  }()
  
  private let scrollView: UIScrollView = {
    let view = UIScrollView()
    view.contentSize = .init(width: UIScreen.main.bounds.width, height: 1000)
    return view
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settingsUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    var largeTitleView = UIView()
    navigationController?.navigationBar.subviews.forEach({ view in
      guard view.description.contains("UINavigationBarLargeTitleView") else { return }
      largeTitleView = view
    })
    largeTitleView.addSubview(imageView)
    imageView.snp.makeConstraints { maker in
      maker.height.width.equalTo(36)
      maker.trailing.equalToSuperview().inset(16)
      maker.bottom.equalToSuperview().inset(12)
    }
  }
  
  func settingsUI() {
    
    view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
    title = "Avatar"
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { maker in
      maker.edges.equalToSuperview()
    }
    navigationController?.navigationBar.prefersLargeTitles = true
  }

}

