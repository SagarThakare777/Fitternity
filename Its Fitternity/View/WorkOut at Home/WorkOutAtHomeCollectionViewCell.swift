//
//  WorkOutAtHomeCollectionViewCell.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 02/06/21.
//

import UIKit

class WorkOutAtHomeCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    //  1. CollectionView
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var upcomingOnlineCollectionView: UICollectionView!
    //  2. Image
    @IBOutlet weak var imgPersonalTraning: UIImageView!
    //  3. Label
    @IBOutlet weak var lblOnlineTraning: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    //  4. Button
    @IBOutlet weak var btnPersonalTraining: UIButton!
    @IBOutlet weak var btnUpcomingOnline: UIButton!
    @IBOutlet weak var btnGetFlat50: UIButton!
    @IBOutlet weak var btnStayTunedFor: UIButton!
    //  4. Image
    @IBOutlet weak var imgOnePass: UIImageView!
    @IBOutlet weak var imgMainOnePass: UIImageView!
    
    //MARK:- Variables
    var arrCategory             : Categories?
    var arrfitness_centres      : fitness_centres?
    var arrPersonalTraning      : personal_training?
    //var arrUpcomingClasses      : upcoming_classes?
    
    var arrCampaign             : [CampaignElement]?
    var arrCategoryTags         : [Categorytag]?
    var arrFitnessCenters       : [FitnessCentresDatum]?
    var arrOnePassPre           : onepass_pre?
    
    var timer                   : Timer?
    var currentCellIndex        = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.configCollectionView()
        self.imgPersonalTraning.decorateView(cornerRadius: 10, borderWidth: 1, borderColor: .clear)
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
            
        self.bannerCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kBannerCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kBannerCollectionViewCell)
        
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.reloadData()
        
        
        self.upcomingOnlineCollectionView.register(UINib(nibName: CollectionViewCellIdentifire.kUpcomingOnlieSessionsCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifire.kUpcomingOnlieSessionsCollectionViewCell)
        
        self.upcomingOnlineCollectionView.delegate = self
        self.upcomingOnlineCollectionView.dataSource = self
        self.upcomingOnlineCollectionView.reloadData()
    }
}
//MARK:- UICollectionView DataSource & Delegate
extension WorkOutAtHomeCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return self.arrCampaign?.count ?? 0
        }
        else {
            return 7//self.arrUpcomingClasses?.data?.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == bannerCollectionView {
        return CGSize(width: 342, height: 173)
        }
        else {
            return CGSize(width: (upcomingOnlineCollectionView.frame.size.width) / 4, height: (upcomingOnlineCollectionView.frame.size.width)/5 - 10)
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
        else {
            let cellBanner: UpcomingOnlieSessionsCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCellIdentifire.kUpcomingOnlieSessionsCollectionViewCell, for: indexPath) as! UpcomingOnlieSessionsCollectionViewCell
            
//            let data = self.arrUpcomingClasses?.data?[indexPath.item]
//            
//            cellBanner.imgCover.sd_setImage(with: URL(string: data?.coverimage ?? ""), placeholderImage: #imageLiteral(resourceName: "qr-code"))
            return cellBanner
        }
    }
}
