
import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/services/fight/easy_fight_service.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/pokemon/ability/mental_attack_ability_model.dart';
import 'package:start_app/models/pokemon/ability/physical_attack_ability_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

void main() {

  PokemonModel playerPokemon;
  PokemonModel cpuPokemon;

  setUp(() {
    playerPokemon = PokemonModel(id: 1, name: "bulbasaur");
    cpuPokemon = PokemonModel(id: 150, name: "mewto");
  });

  group("Easy fight service tests", () {

    test("Init fight state", () {
          IFightService easyFightService = EasyFightService(playerPokemon, cpuPokemon);

          FightStateModel fightState = easyFightService.getFightState();

          expect(fightState != null, true);
          expect(fightState.playerPokemon.hp > fightState.cpuPokemon.hp, true);
          expect(fightState.playerPokemon.energy > fightState.cpuPokemon.energy, true);
      });

      test("Apply player's ability", () {
        IFightService easyFightService = EasyFightService(playerPokemon, cpuPokemon);
          FightStateModel fightState = easyFightService.getFightState();

          double enemyHpBeforeAttack = fightState.cpuPokemon.hp;
          double playerEnergyBeforeAttack = fightState.playerPokemon.energy;
          AbilityModel playerAbility = PhysicalAttackAbilityModel(name: "Grass strike", shortDescription: "Basic attack", damageValue: 5, energyCost: 10);
          easyFightService.applyPlayerAbility(playerAbility);

          fightState = easyFightService.getFightState();
          expect(enemyHpBeforeAttack - fightState.cpuPokemon.hp, 5.0);
          expect(playerEnergyBeforeAttack - fightState.playerPokemon.energy, 10.0);
      });

      test("Apply cpu's ability", () {
        IFightService easyFightService = EasyFightService(playerPokemon, cpuPokemon);
        FightStateModel fightState = easyFightService.getFightState();

        double playerHpBeforeAttack = fightState.playerPokemon.hp;
        double enemyEnergyBeforeAttack = fightState.cpuPokemon.energy;
        AbilityModel enemyAbility = MentalAttackAbilityModel(name: "Mind splash", shortDescription: "Basic mental attack", damageValue: 15, energyCost: 20);
        easyFightService.applyCpuAbility(enemyAbility);

        fightState = easyFightService.getFightState();
        expect(playerHpBeforeAttack - fightState.playerPokemon.hp, 15.0 * 1.5);
        expect(enemyEnergyBeforeAttack - fightState.cpuPokemon.energy, 20.0);
      });
  });

  tearDown(() {

  });
}