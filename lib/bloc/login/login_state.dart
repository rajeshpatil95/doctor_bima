import 'package:equatable/equatable.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthCheckInitialState extends LoginState {
  AuthCheckInitialState();
}

class AuthCheckLoadingState extends LoginState {
  AuthCheckLoadingState();
}

class UserUnAuthenticatedState extends LoginState {
  UserUnAuthenticatedState();
}

class UserAuthenticatedState extends LoginState {
  UserAuthenticatedState();
}

class AuthCheckFailureState extends LoginState {
  AuthCheckFailureState();
}
