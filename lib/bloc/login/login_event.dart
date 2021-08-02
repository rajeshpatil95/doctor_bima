import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CheckIfUserAuthenticatedEvent extends LoginEvent {
  final BuildContext context;

  CheckIfUserAuthenticatedEvent({this.context});

  @override
  String toString() => 'CheckIfUserAuthenticatedEvent';
}
