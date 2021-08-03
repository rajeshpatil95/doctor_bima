import 'package:flutter_flavor/flutter_flavor.dart';

class FlavourVariable {
  static const String flavour = "flavour";
  static const String baseUrl = "baseUrl";
  static const String appName = "appName";
  static const String iconUrl = "iconUrl";
}

class ProductFlavour {
  static const String Dev = "Dev";
  static const String Prod = "Prod";
}

/*===============================
          DEVELOPMENT
  ==============================*/

class Dev {
  static Map<String, String> _strings = {
    FlavourVariable.flavour: "Dev",
    FlavourVariable.baseUrl: "https://5efdb0b9dd373900160b35e2.mockapi.io",
    FlavourVariable.appName: "ChillPay"
  };

  static Map<String, String> _assets = {
    FlavourVariable.iconUrl: "https://dummyimage.com/100x50/000/fff&text=Dev",
  };

  static Map<String, String> flavourVariables = Map()
    ..addAll(_strings)
    ..addAll(_assets);
}

/*===============================
          PRODUCTION
  ==============================*/

class Prod {
  static Map<String, String> _strings = {
    FlavourVariable.flavour: "Prod",
    FlavourVariable.baseUrl: "https://5efdb0b9dd373900160b35e2.mockapi.io",
    FlavourVariable.appName: "ChillPay"
  };

  static Map<String, String> _assets = {
    FlavourVariable.iconUrl: "https://dummyimage.com/100x50/000/fff&text=Prod"
  };

  static Map<String, String> flavourVariables = Map()
    ..addAll(_strings)
    ..addAll(_assets);
}

isDev() =>
    FlavorConfig.instance.variables[FlavourVariable.flavour] ==
    ProductFlavour.Dev;

isProd() =>
    FlavorConfig.instance.variables[FlavourVariable.flavour] ==
    ProductFlavour.Prod;

getFlavourVariable(String flavourVariable) =>
    FlavorConfig.instance.variables[flavourVariable];
