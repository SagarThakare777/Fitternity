//
//  HomeScreenAtHomeModel.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import Foundation

// MARK: - Home Screen At Home Data Model
struct HomeScreenAtHomeDataModel: Codable {
    let cityName: String?
     let cityID: Int?
     let instudio: String?
     let product_tags: [product_tags]?
     let campaigns: [CampaignElement]?
     let categories: Categories?
     let onepassPre: OnepassPre?
     let personalTraining: PersonalTraining?
     let upcomingClasses: UpcomingClasses?
     let fitness_centres: fitness_centres?
     let challenge: Challenge?
     let fitTv: FitTv?
     let sectionOrders: [String]?
 }

 // MARK: - CampaignElement
 struct CampaignElement: Codable {
     let image: String?
     let link: String?
     let title: String?
     let height, width: Int?
     let ratio: Double?
     let order: Int?
 }

// MARK: - FitnessCentres
struct fitness_centres: Codable {
    let title, fitnessCentresDescription, buttonText: String?
    let data: [FitnessCentresDatum]?
}

// MARK: - FitnessCentresDatum
struct FitnessCentresDatum: Codable {
    let average_rating: Double?
    let coverimage: String?
    let location, slug: String?
    let id: Int?
    let categorytags: [String]?
    let category: String?
    let total_rating_count: Int?
    let flags: DatumFlagsClass?
    let commercial: String?
    let featured: Bool?
    let offeringImages: [OfferingImage]?
    let trialHeader, membershipHeader: String?
    let membershipIcon: String?
    let membershipOfferDefault: Bool?
    let membershipOffer, type, address, title: String?
    let subcategories: [String]?
    let tag_image: String?
    let abwVendor: String?
}

// MARK: - DatumFlagsClass
struct DatumFlagsClass: Codable {
    let trial, membership: String?
    let topSelling, newlyLaunched, openingSoon, comingOnOnepass: Bool?
    let state: String?
    let featured, april5, notAvailableOnOnepass, forcedOnOnepass: Bool?
    let liteClasspassAvailable: Bool?
    let covidState: String?
    let covidStateID: Int?
    let covidStateImmediately: Bool?
    let monsoonFlashDiscount: String?
    let monsoonFlashDiscountPer: Int?
    let monsoonFlashDiscountDisabled: Bool?
    let hyperLocalList: [String]?
}

// MARK: - OfferingImage
struct OfferingImage: Codable {
    let image: String?
    let height, width: Int?
}

// MARK: - Categories
struct Categories: Codable {
    let title, text: String?
    let maxCategory: Int?
    let allCategoryTitle: String?
    let categorytags: [Categorytag]?
    let campaign: CategoriesCampaign?
}

// MARK: - CategoriesCampaign
struct CategoriesCampaign: Codable {
    let image: String?
    let title, bgColor, textColor: String?
    let url: String?
}

// MARK: - Categorytag
struct Categorytag: Codable {
    let name, slug: String?
    let id: Int?
    let image: String?
}

 // MARK: - Challenge
 struct Challenge: Codable {
     let title, challengeDescription: String?
     let data: [ChallengeDatum]?
     let campaign: ChallengeCampaign?
 }

 // MARK: - ChallengeCampaign
 struct ChallengeCampaign: Codable {
     let image: String?
     let title, bgColor, textColor: String?
     let url: String?
 }

 // MARK: - ChallengeDatum
 struct ChallengeDatum: Codable {
     let challengeID: Int?
     let challengeSlug: String?
     let priority: Int?
     let webImage: String?
     let wapImage: String?
     let appImage: String?
     let url: String?
 }

 // MARK: - FitTv
 struct FitTv: Codable {
     let title, fitTvDescription, buttonText: String?
     let data: [FitTvDatum]?
     let campaign: ChallengeCampaign?
 }

 // MARK: - FitTvDatum
 struct FitTvDatum: Codable {
     let title: String?
     let duration: Int?
     let image: String?
     let id, difficultyLevel: Int?
     let difficultyLevelStr, trainer, category, slug: String?
 }

 // MARK: - OnepassPre
 struct OnepassPre: Codable {
     let headerImg: String?
     let buttonText: String?
     let passes: Passes?
     let campaign: ChallengeCampaign?
 }

 // MARK: - Passes
 struct Passes: Codable {
     let image: String?
     let header1, header1Color, header2, header2Color: String?
     let subheader, descHeader, onepassType, passesDescription: String?
 }

 // MARK: - PersonalTraining
 struct PersonalTraining: Codable {
     let title, subtitle, personalTrainingDescription: String?
     let image: String?
     let buttonText: String?
     let link: String?
     let campaign: ChallengeCampaign?
 }

 // MARK: - ProductTag
 struct product_tags: Codable {
     let image: String?
     let title, text: String?
     let link: String?
 }

 // MARK: - UpcomingClasses
 struct UpcomingClasses: Codable {
     let title, upcomingClassesDescription, buttonText: String?
     let campaign: ChallengeCampaign?
     let sessionType: String?
     let data: [UpcomingClassesDatum]?
 }

 // MARK: - UpcomingClassesDatum
 struct UpcomingClassesDatum: Codable {
     let averageRating: Double?
     let name, slug, vendorSlug, vendorName: String?
     let coverimage: String?
     let overlayimage, nextSlot: String?
     let totalRatingCount: Int?
     let city: String?
     let id: Int?
     let commercial, serviceType: String?
     let bookingPoints, sessionTime: Int?
     let overlayimageV2: Overlay?
     let ppsOneliner: String?
     let flags: String?
     let overlayDetails: [Overlay]?
     let liveLocation: String?
     let liveLocationIcon: String?
     let specialPrice: Int?
     let bestSeller: Bool?
 }

// MARK: - FlagsClass
struct FlagsClass: Codable {
    let onepassMaxBookingCount: Int?
}

// MARK: - Overlay
struct Overlay: Codable {
    let icon: String?
    let text: String?
}
