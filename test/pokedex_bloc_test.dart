import 'dart:async';
import 'dart:io';
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  IPokemonRepository repo;

  setUp(() {
    repo = DummyPokemonRepository();
  });

  group("Pokedex bloc tests", () {
    test("Initial collection", () {
      final IPokedexBloc bloc = PokedexBloc(repository: repo);

      bloc.outPokemonSearchResults
          .listen(expectAsync1((List<PokemonModel> pokemons) {
        expect(pokemons.length > 0, true);
      }));
    });

    test("Search for request", () async {
      final IPokedexBloc bloc = PokedexBloc(repository: repo);
      final String searchString = "bulb";

      bloc.inPokemonSearch.add(searchString);

      List<PokemonModel> results =
          (await bloc.outPokemonSearchResults.take(2).toList())[1];
      expect(
          results.singleWhere((PokemonModel p) => p.name == "bulbasaur",
                  orElse: () => null) !=
              null,
          true);
      expect(
          results.firstWhere((PokemonModel p) => !p.name.contains(searchString),
              orElse: () => null),
          null);
    });

    test("Debounce checking", () async {
      final IPokedexBloc bloc = PokedexBloc(repository: repo);
      int count = 0;
      bloc.outPokemonSearchResults.listen((data) {
        count++;
      });

      bloc.inPokemonSearch.add("b");
      sleep(const Duration(milliseconds: 100));
      bloc.inPokemonSearch.add("bu");
      sleep(const Duration(milliseconds: 100));
      bloc.inPokemonSearch.add("bul");
      sleep(const Duration(milliseconds: 100));
      bloc.inPokemonSearch.add("bu");
      sleep(const Duration(milliseconds: 100));
      bloc.inPokemonSearch.add("b");

      bool isTimeoutException = false;
      try {
        await bloc.outPokemonSearchResults.timeout(const Duration(seconds: 2)).take(3).toList();
      }
      on TimeoutException {
        isTimeoutException = true;
      }
      expect(isTimeoutException, true);
      expect(count, 2);
    });
  });

  tearDown(() {
    repo = null;
  });
}
