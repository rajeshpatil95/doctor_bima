import 'package:flutter/cupertino.dart';

/// Created by Ajesh Nag on 14/03/21.
Future<String> loadStringFile(BuildContext context, String path) {
  Future<String> string = DefaultAssetBundle.of(context).loadString(path);
  return string;
}
