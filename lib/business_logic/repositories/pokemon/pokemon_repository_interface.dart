import 'package:start_app/models/pokemon/generation_model.dart';

import '../../../models/pokemon/pokemon_model.dart';
import '../../../models/pokemon/type_model.dart';

abstract class IPokemonRepository {

  Future<bool> initRepository();

  List<PokemonModel> getAllPokemons();

}
