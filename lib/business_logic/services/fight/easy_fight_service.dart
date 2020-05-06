import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/fight/pokemon_fight_model.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class EasyFightService implements IFightService {
  FightStateModel _fightState;

  FightStateModel getFightState() => _fightState;

  EasyFightService(PokemonModel first, PokemonModel second) {
    PokemonFightModel firstFightPokemon =
        PokemonFightModel(pokemon: first, hp: 100, energy: 100);
    PokemonFightModel secondFightPokemon =
        PokemonFightModel(pokemon: second, hp: 80, energy: 80);
    _fightState = FightStateModel(
        playerPokemon: firstFightPokemon,
        cpuPokemon: secondFightPokemon,
        turnOwner: TurnOwner.player);
  }

  void applyPlayerAbility(AbilityModel ability) {
    switch (ability.getType()) {
      case AbilityType.selfApplied:
        ability.applyTo(_fightState.playerPokemon);
        break;
      case AbilityType.otherApplied:
        ability.applyTo(_fightState.cpuPokemon);
        break;
      default:
        assert(false, "Should never reach there");
    }
    _fightState.playerPokemon.didUseAbility(ability);
  }

  void applyCpuAbility(AbilityModel ability) {
    switch (ability.getType()) {
      case AbilityType.selfApplied:
        ability.applyTo(_fightState.cpuPokemon);
        break;
      case AbilityType.otherApplied:
        ability.applyTo(_fightState.playerPokemon);
        break;
      default:
        assert(false, "Should never reach there");
    }
    _fightState.cpuPokemon.didUseAbility(ability);
  }

  AbilityModel simulateCpuAbilitySelection() {
    // TODO: implement simulateCpuAbilitySelection
    return null;
  }
}
