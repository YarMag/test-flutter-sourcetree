
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';

enum NewFightPlayerType { player, cpu }

abstract class INewFightBloc extends BlocBase {

  Sink<NewFightPlayerType> inPlayerType;
  Sink<Difficulty> inDifficulty;
  Stream<FightSettingsModel> outSettings;

  Stream<List<PokemonModel>> outGridPokemons;
  Sink<PokemonModel> inSelectedPokemon;
  Stream<PokemonModel> outSelectedPokemon;

  void onStartFightButton();

  NewFightPlayerType getActiveParticipant();

  List<PokemonModel> getPokemonsGridContent();

  FightSettingsModel getFightSettings();

  PokemonModel getActiveParticipantPokemon();

}