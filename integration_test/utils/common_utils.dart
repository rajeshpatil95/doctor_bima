import '../constants/test_constants.dart';

class CommonUtils {
  static String encodeJson(Map<String, dynamic> jsonObject) {
    return TestConstants.prettyEncoder.convert(jsonObject);
  }
}
