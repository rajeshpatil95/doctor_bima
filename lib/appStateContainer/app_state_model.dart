import 'package:scoped_model/scoped_model.dart';

class AppStateModel extends Model {
  AppStateModel();

  bool areDetailsUpdated = false;

  void appUpdateValue(bool value) {
    areDetailsUpdated = value;
    notifyListeners();
  }
}
