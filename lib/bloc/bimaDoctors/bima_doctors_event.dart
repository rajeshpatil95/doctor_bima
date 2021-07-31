import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BimaDoctorsEvent extends Equatable {
  const BimaDoctorsEvent();

  @override
  List<Object> get props => [];
}

class GetBimaDoctorsListEvent extends BimaDoctorsEvent {
  final BuildContext context;

  GetBimaDoctorsListEvent({this.context});

  @override
  String toString() => 'GetBimaDoctorsListEvent';
}
