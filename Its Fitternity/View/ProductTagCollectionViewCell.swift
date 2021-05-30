//
//  ProductTagCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import UIKit

class ProductTagCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    //  1. Label
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    //  2. View
    @IBOutlet weak var vwMain: UIView!
    //  3. Image
    @IBOutlet weak var imgProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.vwMain.decorateView(cornerRadius: 25, borderWidth: 0.5, borderColor: .gray)
        self.imgProduct.decorateView(cornerRadius: 25, borderWidth: 0.5, borderColor: .clear)
    }

}
