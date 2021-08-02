import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:doctor_bima/bloc/login/login_event.dart';
import 'package:doctor_bima/bloc/login/login_state.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/storage/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(AuthCheckInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is CheckIfUserAuthenticatedEvent) {
      yield AuthCheckInitialState();
      yield AuthCheckLoadingState();
      try {
        String localStorageAuthToken = await DI
            .inject<Preferences>()
            .getStringForKey(preferencesKeys.kUserAuthToken);

        if (localStorageAuthToken?.isNotEmpty ?? false) {
          yield UserAuthenticatedState();
        } else {
          yield UserUnAuthenticatedState();
        }
      } catch (e) {
        print("CheckIfUserAuthenticatedEvent Exception: ${e}");
        yield AuthCheckFailureState();
      }
    }
  }
}
