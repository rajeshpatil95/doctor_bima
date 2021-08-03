import 'package:flutter/cupertino.dart';

Future<String> loadStringFile(BuildContext context, String path) {
  Future<String> string = DefaultAssetBundle.of(context).loadString(path);
  return string;
}
