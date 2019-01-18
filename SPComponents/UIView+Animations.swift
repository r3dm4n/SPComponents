//
//  UIView+Extension.swift
//  pizza-delivery
//
//  Created by Alexandru Corut on 09/11/2018.
//  Copyright © 2018 Alexandru Corut. All rights reserved.
//

import UIKit

typealias CompletionHandler = (() -> ())?

enum AnimationType {
    case text, doneImage
}

extension UIView {
    
    func shake() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.08
        anim.repeatCount = 3
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        
        layer.add(anim, forKey: "position")
    }
    
    func promptUser(animation: AnimationType, text: String?, delay: Double, completion: CompletionHandler) {
        switch animation {
        case .text:
            promptUser(withMessage: text ?? "", delay: delay, completion: completion)
        case .doneImage:
            promptUserWithDoneImage(delay: delay, completion: completion)
        }

    }
    
    private func promptUser(withMessage text: String, delay: Double, completion: CompletionHandler) {
        DispatchQueue.main.async {
            let messageLabel = UILabel()
            messageLabel.text = text
            
            self.setupMessageLabel(messageLabel)
            self.setupAnimation(view: messageLabel, delay: delay, completion: completion)
        }
    }
    
    private func promptUserWithDoneImage(delay: Double, completion: CompletionHandler) {
        DispatchQueue.main.async {
            let doneImageView = UIImageView(image: #imageLiteral(resourceName: "done"))
            doneImageView.backgroundColor = UIColor(white: 0, alpha: 0.7)
            doneImageView.clipsToBounds = true
            doneImageView.layer.cornerRadius = 50
            
            self.addSubview(doneImageView)
            doneImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
            doneImageView.anchorInCenter(centerYAnchor: self.centerYAnchor, centerXAnchor: self.centerXAnchor)
            
            self.setupAnimation(view: doneImageView, delay: delay, completion: completion)
        }
    }
    
    //MARK:- Setup Functions
    private func setupAnimation(view: UIView, delay: Double, completion: CompletionHandler) {
        //1
        view.layer.transform = CATransform3DMakeScale(0, 0, 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            //2
            view.layer.transform = CATransform3DMakeScale(1, 1, 1)
            
        }, completion: { (completed) in
            UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                //3
                view.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
                view.alpha = 0
            }, completion: { (_) in
                view.removeFromSuperview()
                completion?()
            })
            
        })
    }
    

    private func setupMessageLabel(_ label: UILabel) {
        addSubview(label)
        
        label.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 16, paddingRight: 32, width: frame.width / 1.5, height: 80)
        label.anchorInCenter(centerYAnchor: centerYAnchor, centerXAnchor: centerXAnchor)
        
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = UIColor(white: 0, alpha: 0.7)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.sizeToFit()
        label.clipsToBounds = true
        label.layer.transform = CATransform3DMakeScale(0, 0, 0)
    }

}
