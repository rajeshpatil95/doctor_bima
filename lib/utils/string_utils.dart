import 'dart:io';
import 'package:intl/intl.dart';
import 'package:doctor_bima/utils/extensions.dart';

bool isNullOrEmpty(String str) {
  return str == null || str.length == 0;
}

bool isNullOrEmptyList(List<Object> list) {
  return list == null || list.isEmpty;
}

class Util {
  static const String PAN_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

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

  static String convertToDateFormat(String transactionDate) {
    final dateToConvert = DateTime.parse(transactionDate).toLocal();
    DateFormat format = new DateFormat("dd MMMM yyyy");
    return format.format(dateToConvert);
  }

  static String formatToDob(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  static dynamic roundToNearestTen(dynamic amount) {
    dynamic rem = amount % 10;
    return rem >= 5 ? (amount - rem + 10) : (amount - rem);
  }
}
