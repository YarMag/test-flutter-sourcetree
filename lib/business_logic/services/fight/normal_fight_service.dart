
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/fight/pokemon_fight_model.dart';

class NormalFightService implements IFightService {
  FightStateModel getFightState() {
    return null;
  }

  void applyPlayerAbility(AbilityModel ability) {

  }

  void applyCpuAbility(AbilityModel ability) {

  }

  AbilityModel simulateCpuAbilitySelection() {
    // TODO: implement simulateCpuAbilitySelection
    return null;
  }
}