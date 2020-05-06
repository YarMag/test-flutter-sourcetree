import 'package:flutter/foundation.dart';
import 'package:start_app/models/fight/ability_affectable_interface.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';

class MentalAttackAbilityModel extends AbilityModel {
  final double damageValue;

  MentalAttackAbilityModel(
      {@required String name,
      @required String shortDescription,
      @required this.damageValue,
      @required double energyCost})
      : super(
            name: name,
            shortDescription: shortDescription,
            energyCost: energyCost);

  AbilityType getType() {
    return AbilityType.otherApplied;
  }

  void applyTo(IAbilityAffectable target) {
    target.acceptMentalAttack(this);
  }
}
