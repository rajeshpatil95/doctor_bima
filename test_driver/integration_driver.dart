import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_driver/flutter_driver.dart';
import '../integration_test/constants/test_constants.dart';
import '../integration_test/utils/common_utils.dart';

Future<void> main() async {
  integrationDriver(responseDataCallback: (Map<String, dynamic> data) async {
    await fs
        .directory(TestConstants.destinationDirectory)
        .create(recursive: true);

    final file = fs.file(path.join(
      TestConstants.destinationDirectory,
      '${TestConstants.testOutputFilename}.json',
    ));

    final resultString = CommonUtils.encodeJson(data);

    await file.writeAsString(resultString);
  });
}
