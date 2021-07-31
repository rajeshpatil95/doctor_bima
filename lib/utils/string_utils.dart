import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:doctor_bima/utils/extensions.dart';
import 'package:doctor_bima/generated/l10n.dart';

bool isNullOrEmpty(String str) {
  return str == null || str.length == 0;
}

bool isNullOrEmptyList(List<Object> list) {
  return list == null || list.isEmpty;
}

class Util {
  static const String PAN_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String PINCODE_PATTERN = r'[0-9]{6}';

  static const String PAN_PATTERN1='[A-Z]{5}[0-9]{4}[A-Z]{1}';

  static const String NUMBER_PATTERN = '[^0-9]';

  ///Rupee Symbol: [₹]
  static String get rupeeSymbol => '\u20B9';

  ///Register symbol
  static String get registerSymbol => '\u00AE';

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  /// Return Date in the format of [DD MM YYYY].
  static String parseDate(data, {inCaps = true}) {
    var date = '';
    try {
      var formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(data);
      var formatterM = DateFormat.MMM(Intl.getCurrentLocale());
      var formatterD = DateFormat.d(Intl.getCurrentLocale());
      var formatterY = DateFormat.y(Intl.getCurrentLocale());
      var month = '';
      if (inCaps)
        month = formatterM.format(formattedDate).toLowerCase().inCaps;
      else
        month = formatterM.format(formattedDate).toUpperCase();
      date = '${formatterD.format(formattedDate)}' +
          ' $month ' +
          formatterY.format(formattedDate);
    } catch (e) {
      date = '';
    }
    return date;
  }

  /// Return Time in the format of [HH:MM ].
  static String parseTime(data) {
    var time = '';
    try {
      var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(data);
      time = DateFormat.jm(Intl.getCurrentLocale()).format(dateTime);
    } catch (e) {
      time = '';
    }
    return time;
  }

  static String currencyFormatter(value) {
    final currencyFormatter =
        NumberFormat.simpleCurrency(locale: 'HI', decimalDigits: 0);
    return currencyFormatter.format(value);
  }

  static String calculateDifference(
      BuildContext context, String transactionDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final dateToCheck = DateTime.parse(transactionDate).toLocal();
    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == now) {
      return Strings.of(context).dateFormatter_just_now;
    }
    if (aDate == today) {
      return Strings.of(context).dateFormatter_today;
    } else if (aDate == yesterday) {
      return Strings.of(context).dateFormatter_yesterday;
    } else {
      return Strings.of(context).dateFormatter_yesterday;
    }
  }

  static String convertToDateFormat(String transactionDate) {
    final dateToConvert = DateTime.parse(transactionDate).toLocal();
    DateFormat format = new DateFormat("dd MMMM yyyy");
    return format.format(dateToConvert);
  }

  static String formatToDob(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  static int getTotalSeconds(String dateTime) {
    final dateToConvert = DateTime.parse(dateTime).toLocal();
    final remHour = dateToConvert.hour;
    final remMin = dateToConvert.minute;
    final remSec = dateToConvert.second;
    return remHour * 3600 + remMin * 60 + remSec;
  }

  static int calculateRemainingSec(String transactionDate) {
    //secondsRemaining = (txnTime + 24hr) - currentTime;
    final endTime = DateTime.parse(transactionDate).add(Duration(days: 1));
    final currentTime = DateTime.now();
    final remainingTime =
        endTime.toLocal().difference(currentTime.toLocal()).inSeconds;

    return remainingTime;
  }

  static double calcInterestAmount(
      {int tenure, dynamic principalAmnt, dynamic interestRate}) {
    // Interest Amount = (EMI * tenure) - P
    final interestAmount = ((calcEMIPerMonth(
                tenure: tenure,
                principalAmnt: principalAmnt,
                interestRate: interestRate) *
            tenure) -
        principalAmnt);

    return interestAmount;
  }

  static dynamic roundToNearestTen(dynamic amount) {
    dynamic rem = amount % 10;
    return rem >= 5 ? (amount - rem + 10) : (amount - rem);
  }

  static double calcEMIPerMonth(
      {int tenure, dynamic principalAmnt, dynamic interestRate}) {
    // EMI=(P * R * (1 + R)^n) / ((1 + R)^n -  1)
    // Principal(P)
    // Interest Rate(R)
    // Number of Instalments(N)
    final interestRatePerMonth = interestRate / (12 * 100);

    final emiPerMonth = (principalAmnt *
            interestRatePerMonth *
            pow(1 + interestRatePerMonth, tenure)) /
        ((pow(1 + interestRatePerMonth, tenure) - 1));

    return roundToNearestTen(emiPerMonth);
  }

  // Strings at index 0 is not used, it is to make array
  // indexing simple
  static List<String> one = [
    "",
    "one ",
    "two ",
    "three ",
    "four ",
    "five ",
    "six ",
    "seven ",
    "eight ",
    "nine ",
    "ten ",
    "eleven ",
    "twelve ",
    "thirteen ",
    "fourteen ",
    "fifteen ",
    "sixteen ",
    "seventeen ",
    "eighteen ",
    "nineteen "
  ];

  // Strings at index 0 and 1 are not used, they is to
  // make array indexing simple
  static List<String> ten = [
    "",
    "",
    "twenty ",
    "thirty ",
    "forty ",
    "fifty ",
    "sixty ",
    "seventy ",
    "eighty ",
    "ninety "
  ];

  // n is 1- or 2-digit number
  static String numToWords(int n, String s) {
    String str = "";
    // if n is more than 19, divide it
    if (n > 19) {
      str += ten[n ~/ 10] + one[n % 10];
    } else {
      str += one[n];
    }

    // if n is non-zero
    if (n != 0) {
      str += s;
    }

    return str;
  }

  // Function to print a given number in words
  static String convertToWords(int n) {
    // stores word representation of given number n
    String out = "";

    // handles digits at ten millions and hundred
    // millions places (if any)
    out += numToWords(n ~/ 10000000, "crore ");

    // handles digits at hundred thousands and one
    // millions places (if any)
    out += numToWords(((n ~/ 100000) % 100), "lakh ");

    // handles digits at thousands and tens thousands
    // places (if any)
    out += numToWords(((n ~/ 1000) % 100), "thousand ");

    // handles digit at hundreds places (if any)
    out += numToWords(((n ~/ 100) % 10), "hundred ");

    if (n > 100 && n % 100 > 0) {
      out += "and ";
    }

    // handles digits at ones and tens places (if any)
    out += numToWords((n % 100), "");

    return out;
  }

  static Future<Map<String, List<String>>> convertCSVToMap() async {
    Map<String, List<String>> pincodeMap;
    // Add the file in assets and then give it proper path
    String output = await loadCSVInString('assets/res/pincode_mapping.csv');
    pincodeMap = await convertStringToMap(output);
    return pincodeMap;
  }

  static Future<String> loadCSVInString(String path) async {
    return await rootBundle.loadString(path);
  }

  static Future<Map<String, List<String>>> convertStringToMap(String output) async {
    Map<String, List<String>> ans = {};
    int index = 0;
    while (index < output.length) {
      int tempIndex = index;
      String pincode, city, state;
      while (output[tempIndex] != ',') tempIndex++;
      pincode = output.substring(index, tempIndex);
      tempIndex++;
      index = tempIndex;

      while (output[tempIndex] != ',') tempIndex++;
      city = output.substring(index, tempIndex);

      tempIndex++;
      index = tempIndex;

      while (tempIndex < output.length && output[tempIndex] != '\n') tempIndex++;
      state = output.substring(index, tempIndex);

      tempIndex++;
      index = tempIndex;

      ans[pincode] = [city, state];
    }
    return ans;
  }
}
