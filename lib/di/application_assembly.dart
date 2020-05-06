import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc.dart';
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc_interface.dart';
import 'package:start_app/di/builders.dart';
import 'package:start_app/business_logic/repositories/pokemon/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/services/fight/fight_service_factory.dart';
import 'package:start_app/business_logic/services/network/common/dio_network_service.dart';
import 'package:start_app/business_logic/services/network/common/network_service_interface.dart';
import 'package:start_app/business_logic/services/network/pokemon/pokemon_network_service.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';
import 'package:start_app/ui/screens/highscores_screen.dart';
import 'package:start_app/ui/screens/main_screen.dart';
import 'package:start_app/ui/screens/new_fight_screen.dart';
import 'package:start_app/ui/screens/pokedex_screen.dart';
import 'package:start_app/ui/screens/single_fight_screen.dart';
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/ui/screens/startup_screen.dart';

class ApplicationAssembly {
  static StatefulWidget getCompositionRoot() {
    return _startupScreenBuilder();
  }

  //#region Services
  static IFightServiceFactory _fightServiceFactory = FightServiceFactory();

  static IPokemonRepository _pokemonRepository = DummyPokemonRepository();

  static INetworkService _networkService() =>
      DioNetworkService(baseURL: "https://pokeapi.co/api/v2/");

  static PokemonNetworkService _pokemonNetworkService() =>
      PokemonNetworkService(networkService: _networkService());
  //#endregion

  //#region Blocs
  static IStartupBloc _startupBloc() =>
      StartupBloc(pokemonRepository: _pokemonRepository);

  static IMainMenuBloc _mainMenuBloc() => MainMenuBloc();

  static INewFightBloc _newFightBloc() =>
      NewFightBloc(pokemonRepository: _pokemonRepository);

  static ISingleFightBloc _singleFightBloc(FightSettingsModel settings) =>
      SingleFightBloc(service: _fightServiceFactory.create(settings));

  static IHighscoresBloc _highscoreBloc() => HighscoresBloc();

  static IPokedexBloc _pokedexBloc() =>
      PokedexBloc(repository: _pokemonRepository);
  //#endregion

  //#region ScreenBuilders

  static MainScreenBuilder _mainScreenBuilder = () {
    return BlocProvider<IMainMenuBloc>(
      child: MainScreen(
        newFightScreenBuilder: _newFightScreenBuilder,
        highscoresScreenBuilder: _highscoresScreenBuilder,
        pokedexScreenBuilder: _pokedexScreenBuilder,
      ),
      bloc: _mainMenuBloc(),
    );
  };

  static StartupScreenBuilder _startupScreenBuilder = () {
    return BlocProvider<IStartupBloc>(
      child: StartupScreen(mainScreenBuilder: _mainScreenBuilder),
      bloc: _startupBloc(),
    );
  };

  static NewFightScreenBuilder _newFightScreenBuilder = () {
    return BlocProvider<INewFightBloc>(
      child:
          NewFightScreen(singleFightScreenBuilder: _singleFightScreenBuilder),
      bloc: _newFightBloc(),
    );
  };

  static SingleFightScreenBuilder _singleFightScreenBuilder =
      (FightSettingsModel settings) {
    return BlocProvider<ISingleFightBloc>(
      child: SingleFightScreen(),
      bloc: _singleFightBloc(settings),
    );
  };

  static HighscoresScreenBuilder _highscoresScreenBuilder = () {
    return BlocProvider<IHighscoresBloc>(
      child: HighscoresScreen(),
      bloc: _highscoreBloc(),
    );
  };

  static PokedexScreenBuilder _pokedexScreenBuilder = () {
    return BlocProvider<IPokedexBloc>(
        child: PokedexScreen(), bloc: _pokedexBloc());
  };

  //#endregion
}
