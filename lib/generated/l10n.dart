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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance;
  }

  static Strings maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `SAVE PROFILE`
  String get saveProfile {
    return Intl.message(
      'SAVE PROFILE',
      name: 'saveProfile',
      desc: '',
      args: [],
    );
  }

  /// `EDIT PROFILE`
  String get editProfile {
    return Intl.message(
      'EDIT PROFILE',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `PERSONAL DETAILS`
  String get personalDetails {
    return Intl.message(
      'PERSONAL DETAILS',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `FIRST NAME`
  String get firstName {
    return Intl.message(
      'FIRST NAME',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `LAST NAME`
  String get lastName {
    return Intl.message(
      'LAST NAME',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT NUMBER`
  String get contactNumber {
    return Intl.message(
      'CONTACT NUMBER',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong please try again later.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong please try again later.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Phone cannot be empty.`
  String get cannotBeEmpty {
    return Intl.message(
      'Phone cannot be empty.',
      name: 'cannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get enterValidPhone {
    return Intl.message(
      'Enter a valid phone number',
      name: 'enterValidPhone',
      desc: '',
      args: [],
    );
  }

  /// `ENTER YOUR MOBILE NUMBER`
  String get enterYourMobileNumber {
    return Intl.message(
      'ENTER YOUR MOBILE NUMBER',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid phone number.`
  String get pleaseEnterValidPhone {
    return Intl.message(
      'Please enter valid phone number.',
      name: 'pleaseEnterValidPhone',
      desc: '',
      args: [],
    );
  }

  /// `We will send you an SMS with the verification code to this number`
  String get weWillSendOtp {
    return Intl.message(
      'We will send you an SMS with the verification code to this number',
      name: 'weWillSendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Hang On...Loading..!!`
  String get hangOn {
    return Intl.message(
      'Hang On...Loading..!!',
      name: 'hangOn',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueStr {
    return Intl.message(
      'Continue',
      name: 'continueStr',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code that was sent to`
  String get pleaseEnterOtp {
    return Intl.message(
      'Please enter the verification code that was sent to',
      name: 'pleaseEnterOtp',
      desc: '',
      args: [],
    );
  }

  /// `invalid OTP`
  String get invalidOtp {
    return Intl.message(
      'invalid OTP',
      name: 'invalidOtp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the Terms Of Use and Privacy Policy`
  String get tAndC {
    return Intl.message(
      'I agree to the Terms Of Use and Privacy Policy',
      name: 'tAndC',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
