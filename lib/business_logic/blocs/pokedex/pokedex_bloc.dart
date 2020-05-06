import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class PokedexBloc extends IPokedexBloc {
  final IPokemonRepository _pokemonRepository;
  final BehaviorSubject<String> _pokemonSearchRequestSubject =
      BehaviorSubject<String>();
  final BehaviorSubject<List<PokemonModel>> _pokemonSearchResultsSubject =
      BehaviorSubject<List<PokemonModel>>();

  Sink<String> get inPokemonSearch => _pokemonSearchRequestSubject.sink;
  Stream<String> get _outPokemonSearch => _pokemonSearchRequestSubject.stream;

  Sink<List<PokemonModel>> get _inPokemonSearchResults =>
      _pokemonSearchResultsSubject.sink;
  Stream<List<PokemonModel>> get outPokemonSearchResults =>
      _pokemonSearchResultsSubject.stream;

  PokedexBloc({@required IPokemonRepository repository})
      : this._pokemonRepository = repository {
    _inPokemonSearchResults.add(repository.getAllPokemons());
    _outPokemonSearch
        .distinct()
        .debounceTime(const Duration(milliseconds: 500))
        .listen(_onNewStringRequest);
  }

  @override
  void dispose() {
    _pokemonSearchRequestSubject.close();
    _pokemonSearchResultsSubject.close();
  }

  void _onNewStringRequest(String value) {
    List<PokemonModel> searchResults = _pokemonRepository.getAllPokemons().where((p) => p.name.contains(value)).toList();
    _inPokemonSearchResults.add(searchResults);
  }
}
