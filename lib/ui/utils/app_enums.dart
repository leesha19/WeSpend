import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wespend/framework/utils/extension/string_extension.dart';
import 'package:wespend/ui/utils/theme/app_strings.g.dart';

/// Page error
enum ErrorType { error403, error404, noInternet }


enum TicketStatus {ALL,PENDING,ACKNOWLEDGED,RESOLVED}
enum LanguageType{
  en, ar
}

enum AdsType{
  Default,
  Client,
}
enum QuestionAnswerStep {
  basicDetails,
  dynamicContent,
  exitQuestions,
}

enum ClientTypeEnum {
  CARSHOWROOM('CAR_SHOWROOM');

  final String moduleName;
  const ClientTypeEnum(this.moduleName);

  String get text => moduleName;
}


enum StatusEnum {
  ACTIVE,INACTIVE,PENDING,ACCEPTED,REJECTED,NEW,PAID,CANCELLED,ONGOING,COMPLETED,UPCOMING,APPROVED,ACKNOWLEDGED,REFUND,FAILED,IN_PROCESS,INPROCESS,PARTIALLY_FAILED,REFUND_COMPLETED,PARTIAL,FULL,PAYMENT_WAITING,SUCCESS,EXPIRED
}

final statusEnumValues = EnumValues({
  'ACTIVE': StatusEnum.ACTIVE,
  'INACTIVE': StatusEnum.INACTIVE,
  'PENDING': StatusEnum.PENDING,
  'ACCEPTED': StatusEnum.ACCEPTED,
  'REJECTED': StatusEnum.REJECTED,
  'REFUND_COMPLETED': StatusEnum.REFUND_COMPLETED,
  'NEW': StatusEnum.NEW,
  'PAID': StatusEnum.PAID,
  'CANCELLED': StatusEnum.CANCELLED,
  'ONGOING': StatusEnum.ONGOING,
  'COMPLETED': StatusEnum.COMPLETED,
  'UPCOMING': StatusEnum.UPCOMING,
  'APPROVED': StatusEnum.APPROVED,
  'ACKNOWLEDGED': StatusEnum.ACKNOWLEDGED,
  'CREDIT': TransactionsType.CREDIT,
  'DEBIT': TransactionsType.DEBIT,
  'REFUND': StatusEnum.REFUND,
  'PARTIALLY_FAILED': StatusEnum.PARTIALLY_FAILED,
  'IN_PROCESS': StatusEnum.IN_PROCESS,
  'INPROCESS': StatusEnum.INPROCESS,
  'FAILED': StatusEnum.FAILED,
  'RESOLVED': TicketStatus.RESOLVED,
  'PAYMENT_WAITING': StatusEnum.PAYMENT_WAITING,
  'SUCCESS': StatusEnum.SUCCESS,
  'EXPIRED': StatusEnum.EXPIRED,
});


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }

}

enum FieldEnums {
  id,
  uuid,
  name,
  createdAt,
  updatedAt,
  active,
  state,
  destinationType,
  totalFloor,
  houseNumber,
  adsShowTime,
  streetName,
  addressLine1,
  addressLine2,
  landmark,
  city,
  country,
  postalCode,
  ownerName,
  email,
  contactNumber,
  passcode,
  timeZone,
  fillerPrice,
  premiumPrice,
  destination,
  wallet,
  odigoClient,
  archiveDate,
  adsMediaType,
  contentLength,
  status,
  rejectReason,
  approverId,
  approverName,
  totalContentLength,
  purchaseType,
  weeklyPrice,
  totalWeeks,
  paymentType,
  originalPrice,
  purchasePrice,
  remarks,
  startDate,
  endDate,
  purchase,
  paidPrice,
  installmentDate,
  installmentPaidDate,
  walletAmount,
  serialNumber,
  hostName,
  navigationVersion,
  powerBoardVersion,
  destinationFloor,
  lastConnected,
  lastDisconnected,
  robotDeviceType,
  applicationId,
  packageId,
  none
}

enum AscendingDescendingOrder{
  ASC,
  DESC,
}


enum DynamicFormEnum{
  COUNTRY,
  STATE,
  DESTINATION_NAME,
  CITY,
  TICKET_REASON,
  STORE,
  CATEGORY,
  DESTINATION_TYPE,
  COMPANY,
  ADDRESS,
  FAQ_QUESTION,
  FAQ_ANSWER,
  FLOOR,
  LOCATION_NAME,
  LOCATION_POINT_NAME,
  MODEL_NAME,
  MODEL_AUDIO,
  BRAND_NAME,
  DESCRIPTION,
  BODY_TYPE,
  CHASSIS_TYPE,
  VEHICLE_SEGMENT,
  PLATFORM_ARCHITECTURE,
  MANUFACTURING_PLANT,
  EMISSION_STANDARD,
  COLOUR_NAME,
  FRONT_AXLE,
  REAR_AXLE,
  STEERING_TYPE,
  FRONT_BREAK,
  REAR_BREAK,
  BRAKE_TYPE,
  VARIANT_NAME,
  VARIANT_TYPE,
  ENGINE,
  WHEELS,
  SPARE_TYPE,
  STANDARD_WARRANTY,
  EXTENDED_WARRANTY,
  ROADSIDE_ASSISTANCE,
  SERVICE_INTERVAL,
  SAFETY,
  TECHNOLOGY,
  COMFORT,
  QUESTION_TITLE,
  WELCOME_TITLE,
  ANSWER_TITLE,
  ANSWER_SUBTITLE,
  ANSWER,
  EXIT_SCENE_TITLE,
  EXIT_SCENE_OPTION_A,
  EXIT_SCENE_OPTION_B,
  MULTIMEDIA_TITLE,
  MULTIMEDIA_SUBTITLE,
  MULTIMEDIA_ALT_TEXT,
  EXIT_SCENE_RESPONSE_A,
  EXIT_SCENE_RESPONSE_B,
  FEATURE_VALUES,
  VIDEO_ALT_TEXT,
  TOUR
}

enum DynamicQuestionType {
  colorGallery,
  imageGallery,
  multiMedia,
  models,
  carDetails,
  view360,
  variant,
  variantComparison,
  navigationPoint,
  video,
  tour
}

extension DynamicQuestionTypeExtension on DynamicQuestionType {
  String get label {
    switch (this) {
      case DynamicQuestionType.colorGallery:
        return 'Color Gallery';
      case DynamicQuestionType.imageGallery:
        return 'Image Gallery';
      case DynamicQuestionType.multiMedia:
        return 'Multi Media';
      case DynamicQuestionType.models:
        return 'Models';
      case DynamicQuestionType.carDetails:
        return 'Car Details';
      case DynamicQuestionType.view360:
        return 'View 360';
      case DynamicQuestionType.variant:
        return 'Variant';
      case DynamicQuestionType.variantComparison:
        return 'Variant Comparison';
      case DynamicQuestionType.navigationPoint:
        return 'Navigation Point';
      case DynamicQuestionType.video:
        return 'Video';
      case DynamicQuestionType.tour:
        return 'Tour';

    }
  }
}

extension DynamicQuestionTypeExtensionApi on DynamicQuestionType {
  String get api {
    switch (this) {
      case DynamicQuestionType.colorGallery:
        return 'COLOR_GALLERY';
      case DynamicQuestionType.imageGallery:
        return 'IMAGE_GALLERY';
      case DynamicQuestionType.multiMedia:
        return 'MULTI_MEDIA';
      case DynamicQuestionType.models:
        return 'MODELS';
      case DynamicQuestionType.carDetails:
        return 'CAR_DETAILS';
      case DynamicQuestionType.view360:
        return 'VIEW_360';
      case DynamicQuestionType.variant:
        return 'VARIANT';
      case DynamicQuestionType.variantComparison:
        return 'VARIANT_COMPARISON';
      case DynamicQuestionType.navigationPoint:
        return 'NAVIGATION_POINT';
      case DynamicQuestionType.video:
        return 'VIDEO';
      case DynamicQuestionType.tour:
        return 'TOUR';
    }
  }
}

enum EntityType{
  SUPER_ADMIN,
  DESTINATION,
  DESTINATION_USER,
  USER,
  CLIENT
}

enum NavigationImageType {
  start,
  end,
}

enum NavigationMediaType {
  image,
  video,
}

enum TicketReasonPlatformType{
  // DESTINATION(LocaleKeys.keyDestination),
  // ADVERTISER(LocaleKeys.keyAdvertiser),
  // USER('USER'),
  // GUEST_CUSTOMER('GUEST CUSTOMER'),
  // MAIN_PANEL('MAIN PANEL'),
  CLIENT('CLIENT'),
  DESTINATION('DESTINATION');
  // DESTINATION_USER('DESTINATION USER');

  final String key;
  const TicketReasonPlatformType(this.key);

  String get text => key.localized;
}


extension DriveTypeExtension on DriveType{
  String get api {
    switch(this){
      case DriveType.FWD:
        return 'FWD';
      case DriveType.RWD:
        return 'RWD';
      case DriveType.AWD:
        return 'AWD';
      case DriveType.FOUR_WD:
        return 'FOUR_WD';
    }
  }
}
enum DriveType{
  FWD('FWD'),
  RWD('RWD'),
  AWD('AWD'),
  FOUR_WD('FOUR WD');

  final String key;
  const DriveType(this.key);

  String get text => key.localized;
}

enum TransmissionCategory{
  MANUAL('MANUAL'),
  AUTOMATIC('AUTOMATIC');


  final String key;
  const TransmissionCategory(this.key);

  String get text => key.localized;
}

extension DynamicTransmissionType on TransmissionType {
  String get api {
    switch(this){
      case TransmissionType.AMT:
        return 'AMT';
      case TransmissionType.CVT:
        return 'CVT';
      case TransmissionType.DCT:
        return 'DCT';
      case TransmissionType.SINGLE_SPEED:
        return 'SINGLE_SPEED';
    }
  }
}
enum TransmissionType{
  AMT('AMT'),
  CVT('CVT'),
  DCT('DCT'),
  SINGLE_SPEED('SINGLE SPEED');


  final String key;
  const TransmissionType(this.key);

  String get text => key.localized;
}
enum FuelType{
  PETROL('PETROL'),
  DIESEL('DIESEL'),
  ELECTRIC('ELECTRIC'),;


  final String key;
  const FuelType(this.key);

  String get text => key.localized;
}

enum ParkingBrakeType{
  MANUAL('MANUAL'),
  ELECTRIC('ELECTRIC');


  final String key;
  const ParkingBrakeType(this.key);

  String get text => key.localized;
}
enum TicketStatusType{
  ALL(LocaleKeys.keyAll,null),
  ACKNOWLEDGED(LocaleKeys.keyAcknowledged,'ACKNOWLEDGED'),
  RESOLVED(LocaleKeys.keyResolved,'RESOLVED'),
  PENDING(LocaleKeys.keyPending,'PENDING');

  final String key;
  final String? value;
  const TicketStatusType(this.key,this.value);

  String get text => key.localized;
}

enum PlatFormType{
  Destination,
  Client
}

enum TransactionsType{
  DEBIT,
  CREDIT
}
enum FaqType{
  Destinations,
  Clients
}

enum CmsValueEnum{
  ABOUT_US,PRIVACY_POLICY,TERMS_AND_CONDITION,REFUND,CANCEL
}

extension PlatFormTypeExtension on PlatFormType {
  String label(BuildContext context) {
    switch (this) {
      case PlatFormType.Destination:
        return LocaleKeys.keyDestination.tr(context: context);
      case PlatFormType.Client:
        return LocaleKeys.keyClient.tr(context: context);
    }
  }
}



extension CmsTypeExtension on CmsType {
  String get key {
    switch (this) {
      case CmsType.aboutUs:
        return 'ABOUT_US';
      case CmsType.termsAndCondition:
        return 'TERMS_AND_CONDITION';
      case CmsType.privacyPolicy:
        return 'PRIVACY_POLICY';
      case CmsType.refund:
        return 'REFUND';
      case CmsType.cancel:
        return 'CANCEL';
    }
  }



  String label(BuildContext context) {
    switch (this) {

      case CmsType.aboutUs:
        return LocaleKeys.keyAboutUs.localized;
      case CmsType.termsAndCondition:
        return LocaleKeys.keyTermsAndConditions.localized;
      case CmsType.privacyPolicy:
        return LocaleKeys.keyPrivacyPolicy.localized;
      case CmsType.refund:
        return LocaleKeys.keyRefund.localized;
      case CmsType.cancel:
        return LocaleKeys.keyCancellationPolicy.localized;

    }
  }
}


enum CmsType {
  aboutUs,
  termsAndCondition,
  privacyPolicy,
  refund,
  cancel,
}

enum DrawerMenuEnum{
  DASHBOARD('Dashboard'),
  DESTINATION('Destination'),
  MASTER('Master'),
  DEVICE('Device'),
  // LOCATIONS('Locations'),
  MANAGE_USERS('Manage Users'),
  // ADS('Ads'),
  VEHICLE('Vehicle'),
  QUESTION_ANSWER('Question Answer'),
  // PURCHASE('Purchase'),
  // TRANSACTIONS('Transactions'),
  // WALLET('Wallet'),
  SUPPORT('Support')
  ;

  final String moduleName;
  const DrawerMenuEnum(this.moduleName);

  String get text => moduleName;
}

enum DrawerSubMenuEnum{
  COUNTRY('Country'),
  STATE('State'),
  CITY('City'),
  TICKET_REASON('Ticket Reason'),
  MASTER_DOCUMENT('Master Document'),
  //CATEGORY('Category'),
  // DESTINATION('Destination'),
  // STORE('Store'),

  // DESTINATION_USER('Destination User'),
  CLIENT('Client'),
  ROLE_AND_PERMISSION('Role & Permission'),
  USERS('Users'),


  CAR_CATEGORY('Car Category'),
  COLOUR('Colour'),

  // CLIENT_ADS('Client Ads'),
  // DEFAULT_ADS('Default Ads'),
  // HISTORY('Ads History'),
  // ADS_SEQUENCE_PREVIEW('Ads Preview'),
  // ADS_INSIGHT('Ads Insight'),

  // PURCHASE_TRANSACTIONS('Purchase Transactions'),
  // WALLET_TRANSACTIONS('Wallet Transactions'),
  // ONLINE_PURCHASE('Online Purchase'),
  // ONLINE_PURCHASE_TRANSACTIONS('Online Purchase Transaction'),

  TICKET('Ticket'),
  CMS('CMS Pages'),
  FAQ('FAQ'),
  CONTACTUS('Contact Us'),
  COMPANY('Company');

  final String moduleName;
  const DrawerSubMenuEnum(this.moduleName);

  String get text => moduleName;
}

enum SortOrder { asc, desc, none }

/// Screen name
enum ScreenName {
  login,
  dashboard,
  error,
  master,
  locations,
  manageUsers,
  destination,
  transactions,
  support,
  store,
  agency,
  package,
  robotList,
  ticket,
  ads,
  cmsPages,
  users,
  country,
  state,
  city,
  category,
  destinationType,
  vendor,
  currency,
  rolePermission,
  ticketReason,
  faq,
  none,
  company,
  contactUs,
  resetPassword,
  forgotPassword,
  otpVerification,
  device,
  addEditStore,
  storeDetail,
  settings,
  client,
  addClient,
  editClient,
  clientDetails,
  profile,
  //generalSupport,
  walletTransactions,
  purchaseTransactions,
  wallet,
  destinationUser,
  defaultAds,
  // advertiserAds,
  clientAds,
  purchase,
  //purchaseList,
  purchaseDetails,
  selectAds,
  changeAds,
  notificationList,
  adsSequence,
  adsInsight,
  // adsSequencePreview,
  adsHistory,
  adsPreview,
  robotSequenceDetail,
  onlinePurchase,
  onlinePurchaseTransaction,
  createTicket,
  others,
  vehicle,
  questionAnswer,
  colour,
  carCategory,
  forceUpdatePassword,
  clientDocuments

}

extension DrawerMenuEnumHelper on DrawerMenuEnum {
  static DrawerMenuEnum? fromStringToEnum(String key) {
    try {
      return DrawerMenuEnum.values.firstWhere(
            (e) => e.moduleName.toLowerCase() == key.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}

extension DrawerSubMenuEnumHelper on DrawerSubMenuEnum {
  static DrawerSubMenuEnum? fromStringToEnum(String key) {
    try {
      return DrawerSubMenuEnum.values.firstWhere(
            (e) => e.moduleName.toLowerCase() == key.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}

enum DestinationDaysEnum{
  MONDAY(LocaleKeys.keyMonday),
  TUESDAY(LocaleKeys.keyTuesday),
  WEDNESDAY(LocaleKeys.keyWednesday),
  THURSDAY(LocaleKeys.keyThursday),
  FRIDAY(LocaleKeys.keyFriday),
  SATURDAY(LocaleKeys.keySaturday),
  SUNDAY(LocaleKeys.keySunday);

  final String key;
  const DestinationDaysEnum(this.key);

  String get text => key.localized;

}

enum LocationType{
  ELEVATOR,
  STORE,
  ESCALATOR
}

DestinationDaysEnum? getDestinationDayEnum(String day) {
  try {
    return DestinationDaysEnum.values.firstWhere(
          (e) => e.name.toLowerCase() == day.toLowerCase(),
    );
  } catch (_) {
    return null;
  }
}

enum VehicleFeatureType  {
  comfortCommon,
  technologyCommon,
  safetyCommon,
}

enum VariantFeatureType  {
  safety,
  comfort,
  interior,
  exterior,
  adsFeatures,
  infortainmentDisplay,
  advanceInternetFeatures,
  lightningFeatures,
  interiorDetails

}
extension VariantFeatureTypeExtension on VariantFeatureType {
  String get label {
    switch (this) {
      case VariantFeatureType.safety:
        return 'SAFETY';

      case VariantFeatureType.comfort:
        return 'COMFORT';

      case VariantFeatureType.interior:
        return 'INTERIOR';

      case VariantFeatureType.exterior:
        return 'EXTERIOR';

      case VariantFeatureType.adsFeatures:
        return 'ADAS_FEATURES';

      case VariantFeatureType.infortainmentDisplay:
        return 'INFOTAINMENT_DISPLAY';

      case VariantFeatureType.advanceInternetFeatures:
        return 'ADVANCED_INTERNET_FEATURES';

      case VariantFeatureType.lightningFeatures:
        return 'LIGHTING_FEATURES';

      case VariantFeatureType.interiorDetails:
        return 'INTERIOR_DETAILS';
    }
  }
}

extension VariantFeatureTypeExtensionUI on VariantFeatureType {
  String get ui {
    switch (this) {
      case VariantFeatureType.safety:
        return 'Safety';

      case VariantFeatureType.comfort:
        return 'Comfort';

      case VariantFeatureType.interior:
        return 'Interior';

      case VariantFeatureType.exterior:
        return 'Exterior';

      case VariantFeatureType.adsFeatures:
        return 'Adas Features';

      case VariantFeatureType.infortainmentDisplay:
        return 'Infotainment Display';

      case VariantFeatureType.advanceInternetFeatures:
        return 'Advance Internet Features';

      case VariantFeatureType.lightningFeatures:
        return 'Lighting Features';

      case VariantFeatureType.interiorDetails:
        return 'Interior Details';
    }
  }
}
extension VehicleFeatureTypeExtension on VehicleFeatureType {
  String get api {
    switch (this) {
      case VehicleFeatureType.comfortCommon:
        return 'COMFORT_COMMON';
      case VehicleFeatureType.technologyCommon:
        return 'TECHNOLOGY_COMMON';
      case VehicleFeatureType.safetyCommon:
        return 'SAFETY_COMMON';
    }
  }
}

extension VehicleFeatureLabelTypeExtension on VehicleFeatureType {
  String get label {
    switch (this) {
      case VehicleFeatureType.comfortCommon:
        return 'Comfort';
      case VehicleFeatureType.technologyCommon:
        return 'Technology';
      case VehicleFeatureType.safetyCommon:
        return 'Safety';
    }
  }
}

enum VehicleFeatures {
  ownership,
  safetyRating,
  feature,
  images,
  performance
}
enum VariantFeatures {
  dimensions,
  suspension,
  steering,
  brakes,
  tyresWheels,
  engineOption,
  feature,
  performance
}

extension VehicleFeatureX on VehicleFeatures {
  String get title {
    switch (this) {
      case VehicleFeatures.ownership:
        return 'Ownership';
      case VehicleFeatures.safetyRating:
        return 'Safety Rating';
      case VehicleFeatures.feature:
        return 'Feature';
      case VehicleFeatures.images:
        return '360 Images';
      case VehicleFeatures.performance:
        return 'Performance';
    }
  }
}

extension VariantFeatureX on VariantFeatures {
  String get title {
    switch (this) {
      case VariantFeatures.dimensions:
        return 'Dimensions';
      case VariantFeatures.suspension:
        return 'Suspension';
      case VariantFeatures.steering:
        return 'Steering';
      case VariantFeatures.brakes:
        return 'Brakes';
      case VariantFeatures.tyresWheels:
        return 'Tyres & Wheels';
      case VariantFeatures.engineOption:
        return 'Engine Option';
      case VariantFeatures.feature:
        return 'Feature';
      case VariantFeatures.performance:
        return 'Performance';
    }
  }
}




