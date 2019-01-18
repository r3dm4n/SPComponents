//
//  NoInternetView.swift
//  pizza-delivery
//
//  Created by Alexandru Corut on 18/12/2018.
//  Copyright © 2018 Alexandru Corut. All rights reserved.
//

import UIKit

let PROMPT_CHECK_INTERNET_CONNECTION = "Lipsă conexiune internet"

protocol NoInternetConnectionViewDelegate: class {
    func checkInternetConnection()
}

class NoInternetConnectionView: UIView {
    
    weak var delegate: NoInternetConnectionViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupViews()
        
        isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "wifi"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reîncearcă", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize, weight: .semibold)
        button.layer.cornerRadius = 8.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(handleRetry), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleRetry() {
        delegate?.checkInternetConnection()
    }
    
    private let noInternetLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.text = PROMPT_CHECK_INTERNET_CONNECTION
        return label
    }()
    
    
    private func setupViews() {
        backgroundColor = .white
        
        [imageView, retryButton, noInternetLabel].forEach { addSubview($0) }
        imageView.anchorInCenter(centerYAnchor: centerYAnchor, centerXAnchor: centerXAnchor)
        
        noInternetLabel.anchor(top: nil, left: leftAnchor, bottom: retryButton.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 0)
        retryButton.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 50)
    }
    
    func start() {
        DispatchQueue.main.async {
            self.imageView.isHidden = false
            self.noInternetLabel.isHidden = false
            self.noInternetLabel.isEnabled = true
        }
    }
    
}



