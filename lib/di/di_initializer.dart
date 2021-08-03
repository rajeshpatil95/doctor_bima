import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:doctor_bima/storage/shared_preferences.dart';
import 'package:doctor_bima/webservice/bimaDoctors/bima_doctors_repository.dart';

class DI {
  DI();

  factory DI.initializeDependencies() {
    addDependency<Preferences>(PreferencesImpl(), true);
    addDependency<BimaDoctorsRepository>(BimaDoctorsRepositoryImpl(), true);
    return DI();
  }

  static addDependency<T>(T object, bool isSingleton) {
    Injector().map<T>((injector) => object, isSingleton: isSingleton);
  }

  static addStringDependency(String value, String key) {
    Injector().map<String>((injector) => value, key: key);
  }

  static addDependencyForKey<T>(T object, bool isSingleton, String key) {
    Injector().map<T>((injector) => object, isSingleton: isSingleton, key: key);
  }

  static T inject<T>() {
    return Injector().get<T>();
  }

  static T injectWithKey<T>(String key) {
    return Injector().get<T>(key: key);
  }

  static T injectWithAdditionalParams<T>(
      String key, Map<String, dynamic> additionalParameters) {
    return Injector()
        .get<T>(key: key, additionalParameters: additionalParameters);
  }
}

class DIKey {
  // DI Keys goes here
}
