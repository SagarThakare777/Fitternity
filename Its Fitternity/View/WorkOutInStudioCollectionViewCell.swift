//
//  WorkOutInStudioCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 31/05/21.
//

import UIKit

class WorkOutInStudioCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
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
extension WorkOutInStudioCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrCategoryTags?.count ?? 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: categoryCollectionView.frame.size.width, height: 180)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/2 - 15
        let height = width
          return CGSize(width: width, height: height)
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 17.5, left: 5, bottom: 17.5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
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
