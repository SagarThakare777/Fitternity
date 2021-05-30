////
////  HomeScreenInStudioModel.swift
////  Its Fitternity
////
////  Created by SAGAR THAKARE on 30/05/21.
////
//
//import Foundation
//
//// MARK: - Home Screen In Studio Model
//struct HomeScreenInStudioModelData {
//    let cityName: String?
//    let cityID: Int?
//    let instudio: String?
//    let productTags: [ProductTag]?
//    let campaigns: [CampaignElement]?
//    let categories: Categories?
//    let onepassPre: OnepassPre?
//    let upcomingClasses: UpcomingClasses?
//    let fitnessCentres: FitnessCentres?
//    let sectionOrders: [String]?
//}
//
//// MARK: - CampaignElement
//struct CampaignElement {
//    let image: String?
//    let link: String?
//    let title: String?
//    let height, width: Int?
//    let ratio: Double?
//    let order: Int?
//}
//
//// MARK: - Categories
//struct Categories {
//    let title, text: String?
//    let maxCategory: Int?
//    let allCategoryTitle: String?
//    let categorytags: [Categorytag]?
//    let campaign: CategoriesCampaign?
//}
//
//// MARK: - CategoriesCampaign
//struct CategoriesCampaign {
//    let image: String?
//    let title, bgColor, textColor: String?
//    let url: String?
//}
//
//// MARK: - Categorytag
//struct Categorytag {
//    let name, slug: String?
//    let id: Int?
//    let image: String?
//}
//
//// MARK: - FitnessCentres
//struct FitnessCentres {
//    let title, fitnessCentresDescription, buttonText: String?
//    let data: [FitnessCentresDatum]?
//}
//
//// MARK: - FitnessCentresDatum
//struct FitnessCentresDatum {
//    let averageRating: Double?
//    let coverimage: String?
//    let location, slug: String?
//    let id: Int?
//    let categorytags: [String]?
//    let category: String?
//    let totalRatingCount: Int?
//    let flags: DatumFlagsClass?
//    let commercial: String?
//    let featured: Bool?
//    let offeringImages: [OfferingImage]?
//    let trialHeader, membershipHeader: String?
//    let membershipIcon: String?
//    let membershipOfferDefault: Bool?
//    let membershipOffer, type, address, title: String?
//    let subcategories: [String]?
//    let tagImage: String?
//    let abwVendor: AbwVendorUnion?
//}
//
//enum AbwVendorUnion {
//    case abwVendorClass(AbwVendorClass)
//    case anythingArray([Any?])
//}
//
//// MARK: - AbwVendorClass
//struct AbwVendorClass {
//    let physical, online: String?
//}
//
//// MARK: - DatumFlagsClass
//struct DatumFlagsClass {
//    let trial, membership: String?
//    let topSelling, newlyLaunched, openingSoon, comingOnOnepass: Bool?
//    let state: String?
//    let featured, april5, notAvailableOnOnepass, forcedOnOnepass: Bool?
//    let liteClasspassAvailable: Bool?
//    let covidState: String?
//    let covidStateID: Int?
//    let covidStateImmediately: Bool?
//    let monsoonFlashDiscount: String?
//    let monsoonFlashDiscountPer: Int?
//    let monsoonFlashDiscountDisabled: Bool?
//    let hyperLocalList: [String]?
//}
//
//// MARK: - OfferingImage
//struct OfferingImage {
//    let image: String?
//    let height, width: Int?
//}
//
//// MARK: - OnepassPre
//struct OnepassPre {
//    let headerImg: String?
//    let buttonText: String?
//    let passes: Passes?
//    let campaign: CategoriesCampaign?
//}
//
//// MARK: - Passes
//struct Passes {
//    let image: String?
//    let header1, header1Color, header2, subtitle: String?
//    let header2Color, subheader, descHeader, onepassType: String?
//    let passesDescription: String?
//}
//
//// MARK: - ProductTag
//struct ProductTag {
//    let image: String?
//    let title, text: String?
//    let link: String?
//}
//
//// MARK: - UpcomingClasses
//struct UpcomingClasses {
//    let title, upcomingClassesDescription, buttonText: String?
//    let campaign: CategoriesCampaign?
//    let sessionType: String?
//    let data: [UpcomingClassesDatum]?
//}
//
//// MARK: - UpcomingClassesDatum
//struct UpcomingClassesDatum {
//    let averageRating: Double?
//    let name, slug, vendorSlug, vendorName: String?
//    let coverimage: String?
//    let overlayimage, totalSlots, nextSlot: String?
//    let totalRatingCount: Int?
//    let location: String?
//    let address: Address?
//    let specialPrice: Int?
//    let campaignText, commercial, serviceType: String?
//    let id, bookingPoints, sessionTime: Int?
//    let overlayimageV2: Overlay?
//    let ppsOneliner: String?
//    let flags: FlagsUnion?
//    let overlayDetails: [Overlay]?
//    let tagImage: String?
//}
//
//// MARK: - Address
//struct Address {
//    let pincode: Int?
//    let location, line3, landmark, line2: String?
//    let line1: String?
//}
//
//enum FlagsUnion {
//    case anythingArray([Any?])
//    case flagsFlags(FlagsFlags)
//}
//
//// MARK: - FlagsFlags
//struct FlagsFlags {
//    let onepassMaxBookingCount: Int?
//}
//
//// MARK: - Overlay
//struct Overlay {
//    let icon: String?
//    let text: String?
//}
