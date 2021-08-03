import 'package:http/http.dart';

extension ResponseExtension on Response {
  bool isSuccessful() => this.statusCode == 200;

  bool isError() => this.statusCode >= 400;

  bool isCustomError() => this.statusCode == 477;

  bool isInternalServerError() => this.statusCode == 500;
}
