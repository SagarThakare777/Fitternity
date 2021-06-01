//
//  FitnessCentersCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 01/06/21.
//

import UIKit

class FitnessCentersCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var vwMain: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgCover.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .lightGray)
        self.vwMain.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .lightGray)
    }

}
