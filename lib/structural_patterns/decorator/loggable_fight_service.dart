
import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';

  class LoggableFightService implements IFightService {
    final IFightService _decoratedService;

    LoggableFightService({@required IFightService fightService}):
          this._decoratedService = fightService;

    void applyCpuAbility(AbilityModel ability) {
      _log("Applied cpu ability ${ability.name}");
      _decoratedService.applyCpuAbility(ability);
    }

    void applyPlayerAbility(AbilityModel ability) {
      _log("Applied player ability ${ability.name}");
      _decoratedService.applyCpuAbility(ability);
    }

    FightStateModel getFightState() {
      _log("Fight state requested");
      return _decoratedService.getFightState();
    }

    AbilityModel simulateCpuAbilitySelection() {
      final AbilityModel ability = _decoratedService.simulateCpuAbilitySelection();
      _log("Cpu simulated ability ${ability.name}");
      return ability;
    }

    void _log(String message) {

    }
  }