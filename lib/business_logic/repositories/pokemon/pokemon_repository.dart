import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/business_logic/services/network/pokemon/pokemon_network_service_interface.dart';
import 'package:start_app/models/pokemon/generation_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/pokemon/type_model.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonNetworkService _pokemonNetworkService;

  List<PokemonModel> _pokemons;

  PokemonRepository({@required IPokemonNetworkService pokemonNetworkService})
      : this._pokemonNetworkService = pokemonNetworkService;

  Future<bool> initRepository() async {
    _pokemons = await _pokemonNetworkService.loadAllPokemons();

    return _pokemons != null;
  }

  @override
  List<PokemonModel> getAllPokemons() => _pokemons;

  //#region The rest of class
  @override
  List<PokemonModel> getPokemonsForGeneration(GenerationModel gen) {
    // TODO: implement getPokemonsForGeneration
    return null;
  }

  @override
  List<PokemonModel> getPokemonsForType(TypeModel type) {
    // TODO: implement getPokemonsForType
    return null;
  }
  //#endregion
}


