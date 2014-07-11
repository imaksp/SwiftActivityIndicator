//
//  SwiftActivityIndicator.swift
//  SwiftActivityIndicator
//
//  Created by bohui.xie on 7/11/14.
//  Copyright (c) 2014 xiebohui. All rights reserved.
//

import UIKit
import QuartzCore

class SwiftActivityIndicator: UIView {
    
    var backgroundImageView: UIImageView
    var loadingImageView: UIImageView

    var hidesWhenStopped:Bool
    var _isAnimating:Bool
    
    init(frame: CGRect) {
        self.backgroundImageView = UIImageView(image: UIImage(named: "icon_loading_background.png"))
        self.loadingImageView = UIImageView(image: UIImage(named: "icon_loading.png"))
        self.hidesWhenStopped = true
        self._isAnimating = false
        super.init(frame: frame)
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.loadingImageView)
    }

    override func layoutSubviews() {
        
        self.backgroundImageView.frame = self.bounds
        self.loadingImageView.frame = self.bounds
        
    }
    
    func startAnimating() {
        self._isAnimating = true
        if self.hidden {
            self.hidden = false
        }
        var rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 2 * M_PI
        rotateAnimation.duration = 1.0
        rotateAnimation.repeatDuration = Double(INT_MAX)
        self.layer.addAnimation(rotateAnimation, forKey: "RotateAnimation")
    }
    
    func stopAnimating() {
        if hidesWhenStopped {
            UIView.animateWithDuration(0.3, animations: {() -> Void in self.alpha = 0.0}, completion: {(Bool) -> Void in self.layer.removeAllAnimations()
                self._isAnimating = false
                })
        }
    }
    
    func isAnimating() -> Bool {
        return self._isAnimating
    }
}
