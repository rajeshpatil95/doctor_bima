class AppAnalyticsEvent {
  String name;
  Map<String, String> params;

  AppAnalyticsEvent(this.name);

  AppAnalyticsEvent.withParams(this.name, this.params);
}

class Event {
  static const String analyticsTestEvent = "analyticsTestEvent";
}

class Property {
  static const String url = "Analytics Test";
}