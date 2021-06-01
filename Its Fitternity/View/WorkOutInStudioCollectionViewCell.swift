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
    @IBOutlet weak var fitnessCentersCollectionView: UICollectionView!
    
    //MARK:- Variables
    var arrCategoryTags         : [Categorytag]?
    var arrFitnessCenters       : [FitnessCentresDatum]?
    
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
        
        self.fitnessCentersCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kFitnessCentersCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kFitnessCentersCollectionViewCell)
        
        self.fitnessCentersCollectionView.delegate = self
        self.fitnessCentersCollectionView.dataSource = self
        self.fitnessCentersCollectionView.reloadData()
    }
}
//MARK:- UICollectionView DataSource & Delegate
extension WorkOutInStudioCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoryCollectionView {
            return self.arrCategoryTags?.count ?? 0
        }
        else if collectionView == fitnessCentersCollectionView {
            return self.arrFitnessCenters?.count ?? 0
        }
        else {
            return 0
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: categoryCollectionView.frame.size.width, height: 180)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
        let width = collectionView.frame.size.width/2 - 15
        let height = width
          return CGSize(width: width, height: height)
      }
        else {
            return CGSize(width: fitnessCentersCollectionView.frame.size.width - 70, height: 200)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 17.5, left: 5, bottom: 17.5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            
            let cellProduct: SubCategoryCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kSubCategoryCollectionViewCell, for: indexPath) as! SubCategoryCollectionViewCell
            
            let data = self.arrCategoryTags?[indexPath.item]
            
            cellProduct.lblCategory.text = data?.name?.localizedUppercase
            cellProduct.imgCategory.sd_setShowActivityIndicatorView(true)
            cellProduct.imgCategory.sd_setIndicatorStyle(.medium)
            cellProduct.imgCategory.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
            
            return cellProduct
        }
        else {
            
            let cellFitness: FitnessCentersCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kFitnessCentersCollectionViewCell, for: indexPath) as! FitnessCentersCollectionViewCell
            
            
            let data = self.arrFitnessCenters?[indexPath.item]
            
            cellFitness.lblTitle.text = data?.title?.localizedUppercase
            cellFitness.imgCover.sd_setShowActivityIndicatorView(true)
            cellFitness.imgCover.sd_setIndicatorStyle(.medium)
            cellFitness.imgCover.sd_setImage(with: URL(string: data?.coverimage ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
            
            return cellFitness
        }
    }
}
