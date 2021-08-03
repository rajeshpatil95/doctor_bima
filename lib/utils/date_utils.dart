DateTime getISTDateTime(DateTime utcDateTime) {
  return utcDateTime.add(Duration(hours: 5, minutes: 30));
}
