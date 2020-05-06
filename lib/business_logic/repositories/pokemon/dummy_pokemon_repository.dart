import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import '../../../models/pokemon/pokemon_model.dart';

class DummyPokemonRepository implements IPokemonRepository {
  List<PokemonModel> _pokemons;

  Future<bool> initRepository() async {
    _pokemons = [
      PokemonModel(id: 1, name: "bulbasaur"),
      PokemonModel(id: 4, name: "charmander"),
      PokemonModel(id: 7, name: "squirtle"),
      PokemonModel(id: 25, name: "pickachu"),
      PokemonModel(id: 54, name: "psyduck"),
      PokemonModel(id: 64, name: "kadabra"),
      PokemonModel(id: 93, name: "haunter"),
      PokemonModel(id: 130, name: "gyarados"),
      PokemonModel(id: 150, name: "mewto"),
    ];

    return Future.delayed(const Duration(seconds: 2), () => true);
  }

  List<PokemonModel> getAllPokemons() => _pokemons;

}
