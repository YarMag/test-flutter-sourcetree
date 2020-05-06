import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/services/network/common/network_service_interface.dart';
import 'package:start_app/business_logic/services/network/pokemon/pokemon_network_service_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class PokemonNetworkService implements IPokemonNetworkService {
  final INetworkService _networkService;

  PokemonNetworkService({@required INetworkService networkService})
      : this._networkService = networkService;

  Future<List<PokemonModel>> loadAllPokemons() async {
    Map<String, dynamic> response =
        await _networkService.requestGET("pokemon", {"limit": 151});

    if (response == null || response["results"] == null) {
      return null;
    }

    List<dynamic> jsonPokemons = response["results"];

    List<PokemonModel> result = Iterable<int>.generate(jsonPokemons.length)
        .toList(growable: false)
        .map((int index) =>
            PokemonModel(id: index, name: jsonPokemons[index]["name"]))
        .toList();

    return result;
  }
}
