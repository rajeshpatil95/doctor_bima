import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:doctor_bima/flavour/flavour_variables.dart';
import 'package:doctor_bima/main/main_default.dart';

void main() async {
  FlavorConfig(
      name: 'Prod',
      color: Colors.red,
      location: BannerLocation.topEnd,
      variables: Prod.flavourVariables);

  defaultMain();
}
