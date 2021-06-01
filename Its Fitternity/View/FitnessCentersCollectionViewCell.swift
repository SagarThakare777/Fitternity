//
//  FitnessCentersCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 01/06/21.
//

import UIKit

class FitnessCentersCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    //  1. Image
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgTag: UIImageView!
    //  2. Label
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblAverageRating: UILabel!
    @IBOutlet weak var lblTotalRating: UILabel!
    //  3. View
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var vwRating: UIView!
    @IBOutlet weak var vwGreenRating: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgCover.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .lightGray)
        self.vwMain.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .lightGray)
        self.vwRating.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .lightGray)
        self.vwGreenRating.decorateView(cornerRadius: 5, borderWidth: 1, borderColor: .lightGray)
    }

}
