//
//  Utilities.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import Foundation
import UIKit


//MARK:- UIView
extension UIView {

    //  1. Decorative UIView
    func decorateView(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor){
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
 }

//MARK:- UIView
extension UIViewController {
    
    //  1. Open URL in Safari
    func openURLinSafari(url: String){
        
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
}

//  1. Error Repoering
class ErrorReporting {

    static func showMessage(title: String, msg: String) {
        let alertView = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertView, animated: true, completion: nil)

    }
}
