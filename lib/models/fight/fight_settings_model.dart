
import 'package:start_app/models/pokemon/pokemon_model.dart';

enum Difficulty { easy, normal, hard }

class FightSettingsModel {
  PokemonModel playerPokemon;
  PokemonModel cpuPokemon;
  Difficulty difficulty;

  FightSettingsModel(
      {this.playerPokemon,
      this.cpuPokemon,
      this.difficulty});
}
