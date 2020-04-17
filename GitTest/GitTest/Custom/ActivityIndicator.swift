//
//  ActivityIndicator.swift
//  MarkUs
//
//  Created by dev10 on 9/24/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicator: NSObject{
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
     func show() {
        self.container.frame = (appDelegate.window?.frame)!
        container.center = (appDelegate.window?.center)!
        container.backgroundColor = UtilityClass.UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = (appDelegate.window?.center)!
        loadingView.backgroundColor = UtilityClass.UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame =
            CGRect.init(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint.init(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        appDelegate.window?.addSubview(container)
        activityIndicator.startAnimating()
    }
    
     func hide() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
}
