import 'package:flutter/foundation.dart';
import 'package:start_app/models/fight/ability_affectable_interface.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';

enum DebuffType { healthPenalty, energyPenalty }

class DebuffAbilityModel extends AbilityModel {
  final DebuffType debuffType;

  DebuffAbilityModel(
      {@required this.debuffType,
      @required String name,
      @required String shortDescription,
      @required double energyCost})
      : super(
            name: name,
            shortDescription: shortDescription,
            energyCost: energyCost);

  AbilityType getType() {
    return AbilityType.otherApplied;
  }

  void applyTo(IAbilityAffectable target) {
    target.acceptDebuff(this);
  }
}
