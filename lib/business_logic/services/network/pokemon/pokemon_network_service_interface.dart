
import 'package:start_app/models/pokemon/pokemon_model.dart';

abstract class IPokemonNetworkService {
  Future<List<PokemonModel>> loadAllPokemons();
}