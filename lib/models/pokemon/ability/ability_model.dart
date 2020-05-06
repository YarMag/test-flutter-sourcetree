import 'package:flutter/foundation.dart';
import 'package:start_app/models/fight/ability_affectable_interface.dart';

enum AbilityType { selfApplied, otherApplied }

abstract class AbilityModel {
  final String name;
  final String shortDescription;
  final double energyCost;

  AbilityModel({@required this.name, @required this.shortDescription, @required this.energyCost});

  AbilityType getType();

  void applyTo(IAbilityAffectable target);
}
