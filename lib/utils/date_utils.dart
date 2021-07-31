/// Created by Ajesh Nag on 30/07/20.
DateTime getISTDateTime(DateTime utcDateTime) {
  return utcDateTime.add(Duration(hours: 5, minutes: 30));
}
