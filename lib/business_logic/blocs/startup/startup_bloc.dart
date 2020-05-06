import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';

class StartupBloc extends IStartupBloc {
  final IPokemonRepository _pokemonRepository;

  Future<bool> get isInitialized;

  StartupBloc({@required IPokemonRepository pokemonRepository})
      : this._pokemonRepository = pokemonRepository;

  void startup() {
    isInitialized = _pokemonRepository.initRepository();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
