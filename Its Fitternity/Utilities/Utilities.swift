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

//  2. UIView Border Color + Width ( Top - Bottom - Left - Right )
@IBDesignable final class UIViewSideBorders: UIView {
    @IBInspectable var topColor: UIColor = UIColor.clear
    @IBInspectable var topWidth: CGFloat = 0
    
    @IBInspectable var rightColor: UIColor = UIColor.clear
    @IBInspectable var rightWidth: CGFloat = 0
    
    @IBInspectable var bottomColor: UIColor = UIColor.clear
    @IBInspectable var bottomWidth: CGFloat = 0
    
    @IBInspectable var leftColor: UIColor = UIColor.clear
    @IBInspectable var leftWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let topBorder = CALayer()
        topBorder.backgroundColor = topColor.cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: topWidth)
        self.layer.addSublayer(topBorder)
        
        let rightBorder = CALayer()
        rightBorder.backgroundColor = rightColor.cgColor
        rightBorder.frame = CGRect(x: self.frame.size.width - rightWidth, y: 0, width: rightWidth, height: self.frame.size.height)
        self.layer.addSublayer(rightBorder)
        
        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = bottomColor.cgColor
        bottomBorder.frame = CGRect(x: 0, y: self.frame.size.height - bottomWidth, width: self.frame.size.width, height: bottomWidth)
        self.layer.addSublayer(bottomBorder)
        
        let leftBorder = CALayer()
        leftBorder.backgroundColor = leftColor.cgColor
        leftBorder.frame = CGRect(x: 0, y: self.frame.size.height - leftWidth, width: self.frame.size.width, height: leftWidth)
        self.layer.addSublayer(leftBorder)
    }
}
