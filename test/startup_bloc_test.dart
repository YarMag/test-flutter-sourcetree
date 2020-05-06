import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';

void main() {
  test("Test app startup", () async {
    IPokemonRepository pokemonRepository = DummyPokemonRepository();
    IStartupBloc bloc = StartupBloc(pokemonRepository: pokemonRepository);

    bloc.startup();
    bool isInitialized = await bloc.isInitialized;
    expect(isInitialized, true);
  });
}
