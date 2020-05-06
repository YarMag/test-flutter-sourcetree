import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';

class NewFightBloc extends INewFightBloc {

  //#region Properties
  final IPokemonRepository _repository;
  final FightSettingsModel _settings = FightSettingsModel();
  NewFightPlayerType _activePlayerType;

  final StreamController<NewFightPlayerType> _playerTypeController = StreamController<NewFightPlayerType>();
  final StreamController<Difficulty> _difficultyController = StreamController<Difficulty>();
  final StreamController<PokemonModel> _selectedPokemonController = StreamController<PokemonModel>.broadcast();
  final StreamController<List<PokemonModel>> _pokemonsGridController = StreamController<List<PokemonModel>>();
  final StreamController<FightSettingsModel> _settingsController = StreamController<FightSettingsModel>();

  Sink<NewFightPlayerType> get inPlayerType => _playerTypeController.sink;
  Stream<NewFightPlayerType> get _outPlayerType => _playerTypeController.stream;

  Sink<Difficulty> get inDifficulty => _difficultyController.sink;
  Stream<Difficulty> get _outDifficulty => _difficultyController.stream;

  Sink<PokemonModel> get inSelectedPokemon => _selectedPokemonController.sink;
  Stream<PokemonModel> get outSelectedPokemon => _selectedPokemonController.stream;

  Sink<FightSettingsModel> get _inSettings => _settingsController.sink;
  Stream<FightSettingsModel> get outSettings => _settingsController.stream;

  Sink<List<PokemonModel>> get _inGridPokemons => _pokemonsGridController.sink;
  Stream<List<PokemonModel>> get outGridPokemons => _pokemonsGridController.stream;
  //#endregion

  NewFightBloc({@required IPokemonRepository pokemonRepository})
      : this._repository = pokemonRepository {
    _settings.difficulty = Difficulty.normal;
    _settings.playerPokemon = _getPlayerPokemons()[0];
    _settings.cpuPokemon = _getCPUPokemons()[0];
    _activePlayerType = NewFightPlayerType.player;

    _outPlayerType.listen(_onActivePlayerChanged);
    _outDifficulty.listen(_onDifficultyChanged);
    outSelectedPokemon.listen(_onNewSelectedPokemon);
  }

  //#region Public methods
  NewFightPlayerType getActiveParticipant() {
    return _activePlayerType;
  }

  List<PokemonModel> getPokemonsGridContent() {
    switch (_activePlayerType) {
      case NewFightPlayerType.player:
        return _getPlayerPokemons();
      case NewFightPlayerType.cpu:
        return _getCPUPokemons();
      default:
        assert(false, "Should never reach there");
        return null;
    }
  }

  FightSettingsModel getFightSettings() {
    return _settings;
  }

  PokemonModel getActiveParticipantPokemon() {
    switch (_activePlayerType) {
      case NewFightPlayerType.player:
        return _settings.playerPokemon;
      case NewFightPlayerType.cpu:
        return _settings.cpuPokemon;
      default:
        assert(false, "Should never reach there");
        break;
    }
    return null;
  }

  void onStartFightButton() {

  }

  @override
  void dispose() {
    _settingsController.close();
    _selectedPokemonController.close();
    _difficultyController.close();
    _playerTypeController.close();
    _pokemonsGridController.close();
  }
  //#endregion

  //#region Private methods
  void _onActivePlayerChanged(NewFightPlayerType playerType) {
    _activePlayerType = playerType;
    _inSettings.add(_settings);
    _inGridPokemons.add(getPokemonsGridContent());
  }

  void _onDifficultyChanged(Difficulty newDifficulty) {
    _settings.difficulty = newDifficulty;
    _inSettings.add(_settings);
  }

  List<PokemonModel> _getPlayerPokemons() {
    List<PokemonModel> allPokemons = _repository.getAllPokemons();
    assert(allPokemons.length > 4);
    return allPokemons.sublist(0, 4);
  }

  List<PokemonModel> _getCPUPokemons() {
    List<PokemonModel> allPokemons = _repository.getAllPokemons();
    assert(allPokemons.length > 4);
    return allPokemons.sublist(allPokemons.length - 4, allPokemons.length);
  }

  void _onNewSelectedPokemon(PokemonModel pokemon) {
    switch (_activePlayerType) {
      case NewFightPlayerType.player:
        _settings.playerPokemon = pokemon;
        break;
      case NewFightPlayerType.cpu:
        _settings.cpuPokemon = pokemon;
        break;
      default:
        assert(false, "Should never reach there");
        break;
    }

    _inSettings.add(_settings);
  }
  //#endregion
}
