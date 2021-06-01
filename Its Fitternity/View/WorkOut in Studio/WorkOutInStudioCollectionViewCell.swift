//
//  WorkOutInStudioCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 31/05/21.
//

import UIKit

class WorkOutInStudioCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    //  1. CollectionView
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var fitnessCentersCollectionView: UICollectionView!
    //  2. Label
    @IBOutlet weak var lblDiscover: UILabel!
    @IBOutlet weak var lblExploreGym: UILabel!
    @IBOutlet weak var lblFitnessCenter: UILabel!
    @IBOutlet weak var lblCheck: UILabel!
    @IBOutlet weak var lblTheAllInOne: UILabel!
    @IBOutlet weak var lblAccessTo: UILabel!
    //  3. Image
    @IBOutlet weak var imgOnePass: UIImageView!
    @IBOutlet weak var imgMainOnePass: UIImageView!
    //  4. View
    @IBOutlet weak var vwBuyNow: UIView!
    
    
    //MARK:- Variables
    var arrCategory             : Categories?
    var arrfitness_centres      : fitness_centres?
    var arrCampaign             : [CampaignElement]?
    var arrCategoryTags         : [Categorytag]?
    var arrFitnessCenters       : [FitnessCentresDatum]?
    var arrOnePassPre           : OnepassPre?
    
    var timer                   : Timer?
    var currentCellIndex        = 0
        

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.configCollectionView()
        
        /*
        self.lblDiscover.text       = self.arrCategory?.title
        self.lblExploreGym.text     = self.arrCategory?.text
        self.lblFitnessCenter.text  = self.arrfitness_centres?.title
        self.lblCheck.text          = self.arrfitness_centres.debugDescription
        */
        self.imgOnePass.decorateView(cornerRadius: 30, borderWidth: 1, borderColor: .clear)
        self.vwBuyNow.decorateView(cornerRadius: 5, borderWidth: 1, borderColor: .clear)
        self.imgOnePass.sd_setImage(with: URL(string: self.arrOnePassPre?.passes?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
        self.imgMainOnePass.sd_setImage(with: URL(string: self.arrOnePassPre?.headerImg ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
        
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNextScreen), userInfo: nil, repeats: true)
    }
    
    //  1. Slide to Next Screen
    @objc func slideToNextScreen() {
        
        if currentCellIndex < (arrCategoryTags?.count ?? 0 - 1) {
            currentCellIndex = currentCellIndex + 1
        }
        else {
            currentCellIndex = 0
        }
        self.bannerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        self.bannerCollectionView?.reloadData()
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
        
        self.bannerCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kBannerCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kBannerCollectionViewCell)
        
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.reloadData()
    }
}
//MARK:- UICollectionView DataSource & Delegate
extension WorkOutInStudioCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
         if collectionView == bannerCollectionView {
            return self.arrCampaign?.count ?? 0
        }
        else if collectionView == categoryCollectionView {
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
        
         if collectionView == bannerCollectionView {
            return CGSize(width: 342, height: 173)
        }
        else if collectionView == categoryCollectionView {
        
        /*
        let width = collectionView.frame.size.width/2 - 15
        let height = width
        return CGSize(width: width, height: height)
        */
            return CGSize(width: (categoryCollectionView.frame.size.width - 95) / 2, height: collectionView.frame.size.width/2 - 15)
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
        
        if collectionView == bannerCollectionView {
            
            let cellBanner: BannerCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kBannerCollectionViewCell, for: indexPath) as! BannerCollectionViewCell
            
            let data = self.arrCampaign?[indexPath.item]
            
            cellBanner.imgBanner.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "qr-code"))
            return cellBanner
        }
        else if collectionView == categoryCollectionView {
            
            let cellProduct: SubCategoryCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kSubCategoryCollectionViewCell, for: indexPath) as! SubCategoryCollectionViewCell
            
            let data = self.arrCategoryTags?[indexPath.item]
            
            cellProduct.lblCategory.text = data?.name?.capitalized
            cellProduct.imgCategory.sd_setShowActivityIndicatorView(true)
            cellProduct.imgCategory.sd_setIndicatorStyle(.medium)
            cellProduct.imgCategory.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
            
            return cellProduct
        }
        else {
            
            let cellFitness: FitnessCentersCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kFitnessCentersCollectionViewCell, for: indexPath) as! FitnessCentersCollectionViewCell
            
            
            let data = self.arrFitnessCenters?[indexPath.item]
            
            cellFitness.lblTitle.text           = data?.title?.capitalized
            cellFitness.lblLocation.text        = data?.location?.capitalized
            cellFitness.lblAverageRating.text   = String(data?.average_rating ?? 0.0)
            cellFitness.lblTotalRating.text     = String(data?.total_rating_count ?? 0)
            
            cellFitness.imgCover.sd_setShowActivityIndicatorView(true)
            cellFitness.imgCover.sd_setIndicatorStyle(.medium)
            cellFitness.imgCover.sd_setImage(with: URL(string: data?.coverimage ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
            cellFitness.imgTag.sd_setImage(with: URL(string: data?.tag_image ?? ""), placeholderImage: #imageLiteral(resourceName: "download"))
            return cellFitness
        }
    }
}
