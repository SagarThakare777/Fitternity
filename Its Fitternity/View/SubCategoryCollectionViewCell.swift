//
//  SubCategoryCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.imgCategory.decorateView(cornerRadius: 35, borderWidth: 1, borderColor: .clear)
        
        self.imgCategory.layer.cornerRadius = 16.25
        self.imgCategory.clipsToBounds = true
    }

}
