//
//  BaseVC.swift
//  API_practice
//
//  Created by wooyeong kam on 2021/06/03.
//

import Foundation
import UIKit

class BaseVC : UIViewController{
    
    var vcTitle : String = "" {
        didSet{
            self.title = vcTitle
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: Notification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    @objc fileprivate func showErrorPopup(notification : NSNotification){
        if let data = notification.userInfo?["statusCode"]{
            DispatchQueue.main.async {
                self.view.makeToast("\(data) 에러발생", duration : 1.0, position : .center)
            }
        }
    }
}
