
import 'package:start_app/models/pokemon/ability/buff_ability_model.dart';
import 'package:start_app/models/pokemon/ability/debuff_ability_model.dart';
import 'package:start_app/models/pokemon/ability/mental_attack_ability_model.dart';
import 'package:start_app/models/pokemon/ability/physical_attack_ability_model.dart';

abstract class IAbilityAffectable {
  void acceptPhysicalAttack(PhysicalAttackAbilityModel ability);
  void acceptMentalAttack(MentalAttackAbilityModel ability);
  void acceptBuff(BuffAbilityModel buff);
  void acceptDebuff(DebuffAbilityModel debuff);
}