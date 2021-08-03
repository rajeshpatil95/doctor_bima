// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cannotBeEmpty":
            MessageLookupByLibrary.simpleMessage("Phone cannot be empty."),
        "contactNumber": MessageLookupByLibrary.simpleMessage("CONTACT NUMBER"),
        "continueStr": MessageLookupByLibrary.simpleMessage("Continue"),
        "editProfile": MessageLookupByLibrary.simpleMessage("EDIT PROFILE"),
        "enterValidPhone":
            MessageLookupByLibrary.simpleMessage("Enter a valid phone number"),
        "enterYourMobileNumber":
            MessageLookupByLibrary.simpleMessage("ENTER YOUR MOBILE NUMBER"),
        "firstName": MessageLookupByLibrary.simpleMessage("FIRST NAME"),
        "hangOn": MessageLookupByLibrary.simpleMessage("Hang On...Loading..!!"),
        "invalidOtp": MessageLookupByLibrary.simpleMessage("invalid OTP"),
        "lastName": MessageLookupByLibrary.simpleMessage("LAST NAME"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "personalDetails":
            MessageLookupByLibrary.simpleMessage("PERSONAL DETAILS"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "pleaseEnterOtp": MessageLookupByLibrary.simpleMessage(
            "Please enter the verification code that was sent to"),
        "pleaseEnterValidPhone": MessageLookupByLibrary.simpleMessage(
            "Please enter valid phone number."),
        "saveProfile": MessageLookupByLibrary.simpleMessage("SAVE PROFILE"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong please try again later."),
        "tAndC": MessageLookupByLibrary.simpleMessage(
            "I agree to the Terms Of Use and Privacy Policy"),
        "weWillSendOtp": MessageLookupByLibrary.simpleMessage(
            "We will send you an SMS with the verification code to this number")
      };
}
