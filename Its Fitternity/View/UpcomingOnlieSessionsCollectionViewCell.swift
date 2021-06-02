//
//  UpcomingOnlieSessionsCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 02/06/21.
//

import UIKit

class UpcomingOnlieSessionsCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var vwOverLay: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vwMain.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .lightGray)
        self.vwOverLay.decorateView(cornerRadius: 15, borderWidth: 1, borderColor: .lightGray)
    }

}
