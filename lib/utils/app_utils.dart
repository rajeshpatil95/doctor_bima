import 'package:doctor_bima/native/platform_utils.dart';
import 'package:package_info/package_info.dart';

enum Environment { dev, prod }

/// WARNING: For Android only.
/// TODO Make this handle platforms before using it
Future<Environment> getEnvironment() async {
  PackageInfo packageInfo = await PlatformUtils.getPackageInfo();
  if (packageInfo.packageName.endsWith("app")) {
    return Environment.prod;
  } else if (packageInfo.packageName.endsWith("dev")) {
    return Environment.dev;
  }

  return Environment.dev;
}

Future<bool> isEnvironment(Environment environment) async {
  return await getEnvironment() == environment;
}

bool isDevEnvironment(Environment environment) {
  return Environment.dev == environment;
}

bool isProdEnvironment(Environment environment) {
  return Environment.prod == environment;
}
