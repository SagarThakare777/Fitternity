//
//  CategoryCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    //  1. Label
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    //  2. CollectionView
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    //  3. Button
    @IBOutlet weak var btnViewAll: UIButton!
    
    //MARK:- Variables
    var arrCategoryTags : [Categorytag]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configCollectionView()
    }
    
    //  1. Configure Collectionview
    func configCollectionView() {
        
        self.categoryCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kSubCategoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kSubCategoryCollectionViewCell)
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        self.categoryCollectionView.reloadData()
    }
}
//MARK:- UICollectionView DataSource & Delegate
extension CategoryCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrCategoryTags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellProduct: SubCategoryCollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCellIdentifire.kSubCategoryCollectionViewCell, for: indexPath) as! SubCategoryCollectionViewCell
        
        let data = self.arrCategoryTags?[indexPath.item]
        
        cellProduct.lblCategory.text = data?.name?.localizedUppercase
        cellProduct.imgCategory.sd_setShowActivityIndicatorView(true)
        cellProduct.imgCategory.sd_setIndicatorStyle(.medium)
        cellProduct.imgCategory.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
        
        return cellProduct
    }
}
