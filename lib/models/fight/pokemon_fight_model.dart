import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:start_app/models/fight/ability_affectable_interface.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/pokemon/ability/buff_ability_model.dart';
import 'package:start_app/models/pokemon/ability/debuff_ability_model.dart';
import 'package:start_app/models/pokemon/ability/mental_attack_ability_model.dart';
import 'package:start_app/models/pokemon/ability/physical_attack_ability_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class PokemonFightModel implements IAbilityAffectable {
  final PokemonModel pokemon;
  double hp;
  double energy;
  List<AbilityModel> abilities;
  PokemonFightModel(
      {@required this.pokemon, @required this.hp, @required this.energy});

  void didUseAbility(AbilityModel ability) {
    energy = max(energy - ability.energyCost, 0);
  }

  //#region IAbilityAffectable implementation
  void acceptPhysicalAttack(PhysicalAttackAbilityModel ability) {
    hp = max(hp - ability.damageValue, 0);
  }

  void acceptMentalAttack(MentalAttackAbilityModel ability) {
    hp = max(hp - ability.damageValue * 1.5, 0);
  }

  void acceptBuff(BuffAbilityModel ability) {
    switch (ability.buffType) {
      case BuffType.healthRestoration:
        hp *= 1.1;
        break;
      case BuffType.energyRestoration:
        energy *= 1.2;
        break;
      default:
        assert(false, "Should never reach there");
        break;
    }
  }

  void acceptDebuff(DebuffAbilityModel ability) {
    switch (ability.debuffType) {
      case DebuffType.healthPenalty:
        hp *= 0.9;
        break;
      case DebuffType.energyPenalty:
        energy *= 0.8;
        break;
      default:
        assert(false, "Should never reach there");
        break;
    }
  }
  //#endregion
}
