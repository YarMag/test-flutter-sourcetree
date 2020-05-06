import 'package:flutter/foundation.dart';
import 'package:start_app/models/fight/ability_affectable_interface.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';

enum BuffType { energyRestoration, healthRestoration }

class BuffAbilityModel extends AbilityModel {
  final BuffType buffType;

  BuffAbilityModel(
      {@required this.buffType,
      @required String name,
      @required String shortDescription,
      @required double energyCost})
      : super(
            name: name,
            shortDescription: shortDescription,
            energyCost: energyCost);

  AbilityType getType() {
    return AbilityType.selfApplied;
  }

  void applyTo(IAbilityAffectable target) {
    target.acceptBuff(this);
  }
}
