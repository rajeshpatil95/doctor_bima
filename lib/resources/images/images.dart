/// Created by Ajesh Nag on 10/11/20.
class ImageAsset {
  static const String _imagesPath = "packages/nxt/assets/images/";
  static const String _svgPath = "packages/nxt/assets/svg_icons/";
  static const String _lottiePath = "packages/nxt/assets/lottie/";

  static get(String fileName) => _imagesPath + fileName;

  // Images path
  static const String hand = _imagesPath + "hand.png";
  static const String envelopBack = _imagesPath + "envelop_back.png";
  static const String cardFrontLandscape =
      _imagesPath + "card_front_landscape.png";
  static const String envelopFront = _imagesPath + "envelop_front.png";
  static const String error = _imagesPath + "error_image.png";
  static const String aadhaar=_imagesPath+'aadhaar.png';  

  // Lottie path
  static const String almostThere = _lottiePath + 'almost_there.json';
  static const String almostThereSelected =
      _lottiePath + 'almost_there_selected.json';
  static const String safeAndSecure = _lottiePath + 'safe_and_secure.json';
  static const String automateEmiConversion =
      _lottiePath + 'automatic_emi_conversion.json';
  static const String chooseYourEmi = _lottiePath + 'choose_your_emi.json';
  static const String hoorayConfetti = _lottiePath + 'hooray_confetti.json';
  static const String loadingAnimation = _lottiePath + 'loading_animation.json';
  static const String afterPinLoading = _lottiePath + 'after_pin_loading.json';
  static const String cardActivated =
      _lottiePath + 'card_activated_successfully.json';
  static const String pinUpdated =
      _lottiePath + 'pin_updated_successfully.json';
  static const String swipeUpLottie = _lottiePath + 'swipe_up.json';
  static const String cardBlockingInProcess =
      _lottiePath + 'card_blocking_in_process.json';
  static const String circularLoader = _lottiePath + 'circular_loader.json';
  static const String circularDotLoader =
      _lottiePath + 'circular_dot_loader.json';
  static const String loadingSuccess = _lottiePath + 'loading_success.json';
  static const String saveTenureSuccess =
      _lottiePath + 'save_tenure_success.json';

 

  // SVG paths
  static const String city = _svgPath + 'city.svg';
  static const String flat = _svgPath + 'flat.svg';
  static const String landmark = _svgPath + 'landmark.svg';
  static const String newAddress = _svgPath + 'new_address.svg';
  static const String pincode = _svgPath + 'pincode.svg';
  static const String state = _svgPath + 'state.svg';
  static const String street = _svgPath + 'street.svg';
  static const String addAddress = _svgPath + 'add_address.svg';
  static const String checkboxActive = _svgPath + 'checkbox_active.svg';
  static const String checkboxInactive = _svgPath + 'check_box_inactive.svg';
  static const String radioActive = _svgPath + 'radio_active.svg';
  static const String radioInactive = _svgPath + 'radio_inactive.svg';
  static const String sbmLogo = _svgPath + 'sbm_logo.svg';
  static const String sbmInverse = _svgPath + 'sbm_inverse.svg';
  static const String infoAndTerms = _svgPath + 'info_and_terms.svg';
  static const String home = _svgPath + 'home.svg';
  static const String office = _svgPath + 'office.svg';
  static const String back = _svgPath + 'back.svg';
  static const String cardLastFourDigits =
      _svgPath + 'card_last_four_digits.svg';
  static const String activationCard = _svgPath + 'activation_card.svg';
  static const String help = _svgPath + 'help.svg';
  static const String arrow = _svgPath + 'arrow.svg';
  static const String paid = _svgPath + 'paid.svg';
  static const String overdue = _svgPath + 'overdue.svg';
  static const String copyCardDetails = _svgPath + 'copy_card_details.svg';
  static const String enterCardDetails = _svgPath + 'enter_card_details.svg';
  static const String enterOtp = _svgPath + 'enter_otp.svg';
  static const String openShoppingApp = _svgPath + 'open_shopping_app.svg';
  static const String cardFrontBack = _svgPath + 'card_front_back.svg';
  static const String mtLogo = _svgPath + 'mt_logo.svg';
  static const String masterCardVirtual = _svgPath + 'master_card_virtual.svg';
  static const String masterCardLogo = _svgPath + 'master_card_logo.svg';
  static const String virtualCardBackground =
      _svgPath + 'virtual_card_background.svg';
  static const String zoomIcon = _svgPath + 'zoom_icon.svg';
  static const String editAddress = _svgPath + 'edit_address.svg';
  static const String changeDeliveryAddress =
      _svgPath + 'change_delivery_address.svg';

  static String get swipeLeft => _svgPath + 'swipe_left.svg';
  static String get swipeRight => _svgPath + 'swipe_right.svg';
  static String get swipeUp => _svgPath + 'swipe_up.svg';
  static String get icContactless => _svgPath + 'ic_contactless_payment.svg';
  static String get iconToggleOff => _svgPath + 'ic_toggle_off.svg';
  static String get nextStatement => _svgPath + 'next_statement.svg';

  static String get transactionDetail => _svgPath + 'transaction_detail.svg';

  static String get activeSwitch => _svgPath + 'active_switch.svg';

  static String get onlineTransaction => _svgPath + 'online_transaction.svg';

  static String get onlineTransactionInactive =>
      _svgPath + 'online_transaction_inactive.svg';

  static String get unLock => _svgPath + 'unlock.svg';

  static String get moneyTap => _svgPath + 'money_tap.svg';

  static String get lightbulb => _svgPath + 'lightbulb.svg';

  static String get cardFront => _svgPath + 'card_front.svg';

  static String get cardBackHiddenDetails =>
      _svgPath + 'card_back_hidden_details.svg';

  static String get cardPlainBakground => _svgPath + 'card_background.svg';

  static String get cardBackVerification =>
      _svgPath + 'card_back_verification.svg';

  static String get block => _svgPath + 'block.svg';
  static String get cancel => _svgPath + 'cancel.svg';
  static String get noCardTransaction => _svgPath + 'no_card_transaction.svg';

  static String get lifestyle => _svgPath + 'lifestyle.svg';
  static String get cardBackVisible => _svgPath + 'card_back_visible .svg';

  static String get posTransacton => _svgPath + 'POS_transaction.svg';

  static String get posTransactionInactive =>
      _svgPath + 'POS_transaction_inactive.svg';

  static String get lock => _svgPath + 'lock.svg';

  static String get contactlessPaymentInactive =>
      _svgPath + 'contactless_payment_inactive.svg';

  static String get icMinimum => _svgPath + 'ic_minimum.svg';

  static String get info => _svgPath + 'info.svg';

  static String get upArrow => _svgPath + 'up_arrow.svg';

  static String get rightArrow => _svgPath + 'arrow_right.svg';

  static String get blockCard => _svgPath + 'block_card.svg';

  static String get changeCardPin => _svgPath + 'change_card_pin.svg';

  static String get replaceCardIllustration =>
      _svgPath + 'replace_card_illustration.svg';

  static String get notificationBell => _svgPath + 'notification_bell.svg';

  static String get shoppigIlllustration =>
      _svgPath + 'shoppig_illlustration.svg';

  static String get icDate => _svgPath + 'ic_date.svg';

  static String get shopVirtualCard => _svgPath + 'shop_virtual_card.svg';

  static String get icImportantNote => _svgPath + 'ic_important_note.svg';

  static String get icCard => _svgPath + 'ic_card.svg';

  static String get rupee => _svgPath + 'Rupee.svg';
  static String get timelineGreen => _svgPath + 'timeline_green.svg';
  static String get timelineGrey => _svgPath + 'timeline_grey.svg';
  static String get user => _svgPath + 'User.svg';
  static String get card => _svgPath + 'Card.svg';
  static String get whiteTick => _svgPath + 'white_tick.svg';

  @override
  String toString() => "Get Image and Svg Path from ImageAsset";
}
