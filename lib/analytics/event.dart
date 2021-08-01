class AppAnalyticsEvent {
  String name;
  Map<String, String> params;

  AppAnalyticsEvent(this.name);

  AppAnalyticsEvent.withParams(this.name, this.params);
}

class Event {
  //Home
  static const String transactionDetails = "TransactionDetails";
  static const String cardControl = 'CardControl';
  static const String homeSwipe = 'HomeSwipe';
  static const String cardLaunch = 'CardLaunch';
  static const String ratesAndTerms = 'RatesAndTermsSelected';

  //Card Activation
  static const String cardActivationInitiated = "CardActivationInitiated";
  static const String pinChangeInitiated = "PinChangeInitiated";
  static const String last4DigitEntry = "Last4DigitEntry";
  static const String pinEntry = "PinEntry";
  static const String pinConfirmation = "PinConfirmation";
  static const String cardActivationSuccessful = "CardActivationSuccessful";

  //OnBoarding
  static const String onBoardingScreenOne = "OnBoardingScreenOne";
  static const String onBoardingScreenTwo = "OnBoardingScreenTwo";
  static const String onBoardingScreenThree = "OnBoardingScreenThree";

  //Address Selection
  static const String addressSelected = "AddressSelected";
  static const String addNewAddress = "AddNewAddress";

  //Card Block
  static const String cardBlockInitiated = "CardBlockInitiated";
  static const String cardBlockConfimred = "CardBlockConfimred";

  //Transactions
  static const String viewAllTxnsHistory = "ViewAllTxnsHistory";
  static const String tochangeTenureScreen = "ToTransactionsChangeTenure";
  static const String loanPlanSelected = "LoanPlanSelected";
  static const String convertToLoanSuccess = "ConvertToLoanSuccess";

  //MoneyTap Card
  static const String showCardDetails = "ShowCardDetails";
  static const String sendMeCard = "SendMeCard";
  static const String zoomForCardDetails = "ZoomForCardDetails";

  // Kyc Screen
  static const String kycApprovalInprogress='KycApprovalInprogress';

}

class Property {
  static const String url = "URL";
  static const String id = 'Id';
  static const String cardLocked = 'Lock Unlock Card';
  static const String cardStatus='Card Control';
  static const String swipe = 'Swipe';
  static const String onTap = 'onTap';
}