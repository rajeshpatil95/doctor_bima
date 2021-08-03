import 'dart:async';
import 'event.dart';

class AppAnalyticsManager {
  AppAnalyticsManager.init() {
    AppAnalyticsManager().eventStream.listen((event) {
      print('AnalyticsManager Log event: ${event.name} ${event.params}');
    });
  }

  static final AppAnalyticsManager _instance = AppAnalyticsManager._internal();
  factory AppAnalyticsManager() {
    return _instance;
  }

  AppAnalyticsManager._internal();

  // ignore: close_sinks
  final StreamController<AppAnalyticsEvent> _streamController =
      StreamController<AppAnalyticsEvent>();

  Stream<AppAnalyticsEvent> get eventStream => _streamController.stream;

  addEvent(AppAnalyticsEvent event) {
    _streamController.sink.add(event);
  }
}
