
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

abstract class IPokedexBloc extends BlocBase {
  Sink<String> inPokemonSearch;
  Stream<List<PokemonModel>> outPokemonSearchResults;
}