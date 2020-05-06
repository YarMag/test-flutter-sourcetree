import 'package:flutter/foundation.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/fight/pokemon_fight_model.dart';

enum TurnOwner { player, cpu }

class FightStateModel {
  final PokemonFightModel playerPokemon;
  final PokemonFightModel cpuPokemon;
  final TurnOwner turnOwner;

  FightStateModel(
      {@required this.playerPokemon,
      @required this.cpuPokemon,
      @required this.turnOwner});
}
