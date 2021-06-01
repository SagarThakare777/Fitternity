//
//  DiscoverEventsVC.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import UIKit
import Alamofire
import KVNProgress
import SDWebImage


class DiscoverEventsVC: UIViewController {

    //MARK:- Outlets
    //  1. CollectioView
    @IBOutlet weak var productTagCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var multipleDataCollectionView: UICollectionView!
    //  2. Button
    
    //  3. UIView
    @IBOutlet weak var vwShop: UIView!
    @IBOutlet weak var vwHome: UIView!
    //  4. Image
    @IBOutlet weak var imgShop: UIImageView!
    @IBOutlet weak var imgHome: UIImageView!
    //  5. Label
    @IBOutlet weak var lblShop: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    
    
    //MARK:- Variables
    var arrProductTag           : [product_tags]?
    var arrCampaign             : [CampaignElement]?
    var arrCategory             : Categories?
    var arrFitnessCenters       : [FitnessCentresDatum]?
    var timer                   : Timer?
    var currentCellIndex        = 0
    var isWorkOutInStudio       : Bool = true
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.getHomeScreenInStudioAPICall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNextScreen), userInfo: nil, repeats: true)
    }
    
    //  1. Configuration of UI
    func configureUI() {
        self.configCollectionView()
    }
    //  2. Configure Collectionview
    func configCollectionView() {
        
        self.productTagCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kProductTagCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kProductTagCollectionViewCell)
        
        self.productTagCollectionView.delegate = self
        self.productTagCollectionView.dataSource = self
        self.productTagCollectionView.reloadData()
        
        self.bannerCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kBannerCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kBannerCollectionViewCell)
        
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.reloadData()
        
        //self.multipleDataCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kCategoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kCategoryCollectionViewCell)
        
        self.multipleDataCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kWorkOutInStudioCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kWorkOutInStudioCollectionViewCell)
        
        self.multipleDataCollectionView.delegate = self
        self.multipleDataCollectionView.dataSource = self
        self.multipleDataCollectionView.reloadData()
    }

    //  3. Workout Studio UI Update
    func workoutInStudioUI(){
        
        self.vwShop.backgroundColor = color.orangeColor
        self.imgShop.tintColor      = color.orangeColor
        self.lblShop.textColor      = color.orangeColor
        
        self.vwHome.backgroundColor = UIColor.white
        self.imgHome.tintColor      = color.blackColor
        self.lblHome.textColor      = color.blackColor
        self.isWorkOutInStudio      = true
        self.multipleDataCollectionView.isHidden = false
        self.getHomeScreenInStudioAPICall()
    }
    //  4. Workout Home UI Update
    func workOutAtHomeUI(){
        
        self.vwHome.backgroundColor = color.orangeColor
        self.imgHome.tintColor      = color.orangeColor
        self.lblHome.textColor      = color.orangeColor
        
        self.vwShop.backgroundColor = UIColor.white
        self.imgShop.tintColor      = color.blackColor
        self.lblShop.textColor      = color.blackColor
        self.isWorkOutInStudio      = false
        self.multipleDataCollectionView.isHidden = true
        self.getHomeScreenAtHomeAPICall()
    }
    //  5. Slide to Next Screen
    @objc func slideToNextScreen() {
        
        if currentCellIndex < (arrCampaign?.count ?? 0 - 1) {
            currentCellIndex = currentCellIndex + 1
        }
        else {
            currentCellIndex = 0
        }
        self.bannerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    //MARK:- All Button Action
    //  1. Work Out in Studio
    @IBAction func workOutInStudioBtnAction(_ sender: Any) {
        self.workoutInStudioUI()
    }
    //  2. Work Out at Home
    @IBAction func workOutAtHome(_ sender: Any) {
        self.workOutAtHomeUI()
    }
}

//MARK:- UICollectionView DataSource & Delegate
extension DiscoverEventsVC: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == productTagCollectionView {
            return self.arrProductTag?.count ?? 0
        }
        else if collectionView == bannerCollectionView {
            return self.arrCampaign?.count ?? 0
        }
        else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == productTagCollectionView {
            
            return CGSize(width: ((productTagCollectionView.frame.size.width - 20)), height: (productTagCollectionView.frame.size.width))
        }
        else if collectionView == bannerCollectionView {
            return CGSize(width: 342, height: 173)
        }
        else {
            //return CGSize(width: (multipleDataCollectionView.frame.size.width - 20), height: 175)
            
            return CGSize(width: multipleDataCollectionView.frame.size.width, height: multipleDataCollectionView.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == productTagCollectionView {
          
            let cellProduct: ProductTagCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kProductTagCollectionViewCell, for: indexPath) as! ProductTagCollectionViewCell
            
            let data = self.arrProductTag?[indexPath.item]
            
            cellProduct.lblTitle.text = data?.title
            cellProduct.lblText.text = data?.text
            cellProduct.imgProduct.sd_setShowActivityIndicatorView(true)
            cellProduct.imgProduct.sd_setIndicatorStyle(.medium)
            cellProduct.imgProduct.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "qr-code"))
            
            return cellProduct
        }
        else if collectionView == bannerCollectionView {
            
            let cellBanner: BannerCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kBannerCollectionViewCell, for: indexPath) as! BannerCollectionViewCell
            
            let data = self.arrCampaign?[indexPath.item]
            
            cellBanner.imgBanner.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: #imageLiteral(resourceName: "qr-code"))
            return cellBanner
        }
        else {
            /*
            let cellMultipleData: CategoryCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kCategoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell

            cellMultipleData.lblTitle.text      = self.arrCategory?.title
            cellMultipleData.lblText.text       = self.arrCategory?.text
            cellMultipleData.arrCategoryTags    = self.arrCategory?.categorytags
            cellMultipleData.categoryCollectionView.reloadData()
            return cellMultipleData
            */
            
            let cellMultipleData: WorkOutInStudioCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kWorkOutInStudioCollectionViewCell, for: indexPath) as! WorkOutInStudioCollectionViewCell

//            cellMultipleData.lblTitle.text      = self.arrCategory?.title
//            cellMultipleData.lblText.text       = self.arrCategory?.text
            cellMultipleData.arrCategoryTags    = self.arrCategory?.categorytags
            cellMultipleData.arrFitnessCenters  = self.arrFitnessCenters
            cellMultipleData.categoryCollectionView.reloadData()
            cellMultipleData.fitnessCentersCollectionView.reloadData()
            return cellMultipleData
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.openURLinSafari(url: BaseURL.webSiteURL)
    }
}
//MARK:- All API Calls
extension DiscoverEventsVC {
    
    // 1. get HomeScreen In Studio API Call
    func getHomeScreenInStudioAPICall() {
        
        KVNProgress.show()
        Alamofire.request(NetworkRouter.getHomeScreenInStudio).responseDecodable{ (response: DataResponse<HomeScreenAtHomeDataModel>) in
            
            switch (response.result) {
            case .success(let successData):
                print(successData)
                KVNProgress.dismiss()
                
                self.arrCampaign?.removeAll()
                self.arrProductTag?.removeAll()
                if ((response.data) != nil) {
                    DispatchQueue.main.async {
                        self.arrCampaign    = response.value?.campaigns
                        self.arrProductTag  = response.value?.product_tags
                        self.arrCategory    = response.value?.categories
                        self.arrFitnessCenters = response.value?.fitness_centres?.data
                        self.productTagCollectionView.reloadData()
                        self.bannerCollectionView.reloadData()
                        self.multipleDataCollectionView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    // 2. get HomeScreen At Home API Call
    func getHomeScreenAtHomeAPICall() {
        
        KVNProgress.show()
        Alamofire.request(NetworkRouter.getHomeScreenAtHome).responseDecodable{ (response: DataResponse<HomeScreenAtHomeDataModel>) in
            
            switch (response.result) {
            case .success(let successData):
                print(successData)
                KVNProgress.dismiss()
                
                self.arrCampaign?.removeAll()
                self.arrProductTag?.removeAll()
                if ((response.data) != nil) {
                    DispatchQueue.main.async {
                        self.arrCampaign    = response.value?.campaigns
                        self.arrProductTag  = response.value?.product_tags
                        self.arrCategory    = response.value?.categories
                        self.arrFitnessCenters = response.value?.fitness_centres?.data
                        self.productTagCollectionView.reloadData()
                        self.bannerCollectionView.reloadData()
                        self.multipleDataCollectionView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
