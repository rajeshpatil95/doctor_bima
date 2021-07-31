// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class Strings {
  Strings();
  
  static Strings current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Strings.current = Strings();
      
      return Strings.current;
    });
  } 

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `An error occurred, please try again.`
  String get genericWebRequestError {
    return Intl.message(
      'An error occurred, please try again.',
      name: 'genericWebRequestError',
      desc: '',
      args: [],
    );
  }

  /// `Add New Delivery Address`
  String get addressTitle {
    return Intl.message(
      'Add New Delivery Address',
      name: 'addressTitle',
      desc: '',
      args: [],
    );
  }

  /// `House/Flat/Wing/Building`
  String get flatPlaceholder {
    return Intl.message(
      'House/Flat/Wing/Building',
      name: 'flatPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Example: 1703, Building 3, Raheja Optima Society`
  String get flatNote {
    return Intl.message(
      'Example: 1703, Building 3, Raheja Optima Society',
      name: 'flatNote',
      desc: '',
      args: [],
    );
  }

  /// `Street Address`
  String get streetPlaceholder {
    return Intl.message(
      'Street Address',
      name: 'streetPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Example: 2nd Cross Lane`
  String get streetNote {
    return Intl.message(
      'Example: 2nd Cross Lane',
      name: 'streetNote',
      desc: '',
      args: [],
    );
  }

  /// `If card is lost or stolen`
  String get lostCard {
    return Intl.message(
      'If card is lost or stolen',
      name: 'lostCard',
      desc: '',
      args: [],
    );
  }

  /// `Block My MoneyTap Card`
  String get blockMyMoneyTapCard {
    return Intl.message(
      'Block My MoneyTap Card',
      name: 'blockMyMoneyTapCard',
      desc: '',
      args: [],
    );
  }

  /// `Default tenure`
  String get defaultTenure {
    return Intl.message(
      'Default tenure',
      name: 'defaultTenure',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get dateFormatter_just_now {
    return Intl.message(
      'Just now',
      name: 'dateFormatter_just_now',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get dateFormatter_today {
    return Intl.message(
      'Today',
      name: 'dateFormatter_today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get dateFormatter_yesterday {
    return Intl.message(
      'Yesterday',
      name: 'dateFormatter_yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get dateFormatter_tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'dateFormatter_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Months EMI`
  String get monthsEMI {
    return Intl.message(
      'Months EMI',
      name: 'monthsEMI',
      desc: '',
      args: [],
    );
  }

  /// `Offline Transaction`
  String get offlineTransaction {
    return Intl.message(
      'Offline Transaction',
      name: 'offlineTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Virtual Card Details`
  String get virtualCardDetails {
    return Intl.message(
      'Virtual Card Details',
      name: 'virtualCardDetails',
      desc: '',
      args: [],
    );
  }

  /// `Card Details`
  String get cardDetails {
    return Intl.message(
      'Card Details',
      name: 'cardDetails',
      desc: '',
      args: [],
    );
  }

  /// `Your card is temporarily locked. You can unlock it anytime you want.`
  String get temporarilyLockedUnlockItAnytime {
    return Intl.message(
      'Your card is temporarily locked. You can unlock it anytime you want.',
      name: 'temporarilyLockedUnlockItAnytime',
      desc: '',
      args: [],
    );
  }

  /// `Request New Card`
  String get requestNewCard {
    return Intl.message(
      'Request New Card',
      name: 'requestNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Swipe to activate your card`
  String get swipeToActivateCard {
    return Intl.message(
      'Swipe to activate your card',
      name: 'swipeToActivateCard',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get tenureConfirm {
    return Intl.message(
      'Confirm',
      name: 'tenureConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}