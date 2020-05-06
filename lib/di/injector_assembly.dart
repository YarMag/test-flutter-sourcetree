import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
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
import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/business_logic/services/fight/fight_service_factory.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';
import 'package:start_app/structural_patterns/adapter/network_service_interface.dart';
import 'package:start_app/ui/screens/highscores_screen.dart';
import 'package:start_app/ui/screens/main_screen.dart';
import 'package:start_app/ui/screens/new_fight_screen.dart';
import 'package:start_app/ui/screens/pokedex_screen.dart';
import 'package:start_app/ui/screens/single_fight_screen.dart';
import 'package:start_app/ui/screens/startup_screen.dart';

class Injection {
  static final Injector injector = Injector.getInjector();

  static final String _startupScreenKey = "startupScreen";
  static final String _mainScreenKey = "mainScreen";
  static final String _newFightScreenKey = "newFightScreen";
  static final String _singleFightScreenKey = "singleFightScreen";
  static final String _pokedexScreenKey = "pokedexScreen";
  static final String _highscoresScreenKey = "highscoresScreen";

  static StatefulWidget getCompositionRoot() {
    return (injector.get<StartupScreenBuilder>(key: _startupScreenKey))();
  }

  static void initialize() {
    _registerServices();
    _registerBlocs();
    _registerScreenBuilders();
  }

  static void _registerServices() {
    injector.map<INetworkService>((i) => DioNetworkService());

    injector.map<IFightServiceFactory>((i) => FightServiceFactory(),
        isSingleton: true);

    injector.map<IPokemonRepository>((i) => DummyPokemonRepository(),
        isSingleton: true);
  }

  static void _registerBlocs() {
    injector.map<IMainMenuBloc>((i) => MainMenuBloc());

    injector.map<INewFightBloc>(
        (i) => NewFightBloc(pokemonRepository: i.get<IPokemonRepository>()));

    injector.mapWithParams<ISingleFightBloc>((i, dict) {
      final FightSettingsModel settings = dict["settings"];
      assert(settings != null, "Missed settings for SingleFightBloc creation");
      return SingleFightBloc(
          service: i.get<IFightServiceFactory>().create(settings));
    });

    injector.map<IPokedexBloc>(
        (i) => PokedexBloc(repository: i.get<IPokemonRepository>()));

    injector.map<IStartupBloc>(
        (i) => StartupBloc(pokemonRepository: i.get<IPokemonRepository>()));

    injector.map<IHighscoresBloc>((i) => HighscoresBloc());
  }

  static void _registerScreenBuilders() {
    injector.map<SingleFightScreenBuilder>(
        (i) => (FightSettingsModel settings) {
              return BlocProvider<ISingleFightBloc>(
                child: SingleFightScreen(),
                bloc: i.get<ISingleFightBloc>(
                    additionalParameters: {"settings": settings}),
              );
            },
        isSingleton: true,
        key: _singleFightScreenKey);

    injector.map<NewFightScreenBuilder>(
        (i) => () {
              return BlocProvider<INewFightBloc>(
                child: NewFightScreen(
                    singleFightScreenBuilder: i.get<SingleFightScreenBuilder>(
                        key: _singleFightScreenKey)),
                bloc: i.get<INewFightBloc>(),
              );
            },
        isSingleton: true,
        key: _newFightScreenKey);

    injector.map<PokedexScreenBuilder>(
        (i) => () {
              return BlocProvider<IPokedexBloc>(
                child: PokedexScreen(),
                bloc: i.get<IPokedexBloc>(),
              );
            },
        isSingleton: true,
        key: _pokedexScreenKey);

    injector.map<HighscoresScreenBuilder>(
        (i) => () {
              return BlocProvider<IHighscoresBloc>(
                child: HighscoresScreen(),
                bloc: i.get<IHighscoresBloc>(),
              );
            },
        isSingleton: true,
        key: _highscoresScreenKey);

    injector.map<MainScreenBuilder>(
        (i) => () {
              return BlocProvider<IMainMenuBloc>(
                child: MainScreen(
                  pokedexScreenBuilder:
                      i.get<PokedexScreenBuilder>(key: _pokedexScreenKey),
                  highscoresScreenBuilder:
                      i.get<HighscoresScreenBuilder>(key: _highscoresScreenKey),
                  newFightScreenBuilder:
                      i.get<NewFightScreenBuilder>(key: _newFightScreenKey),
                ),
                bloc: i.get<IMainMenuBloc>(),
              );
            },
        isSingleton: true,
        key: _mainScreenKey);

    injector.map<StartupScreenBuilder>(
        (i) => () {
              return BlocProvider(
                child: StartupScreen(
                    mainScreenBuilder:
                        i.get<MainScreenBuilder>(key: _mainScreenKey)),
                bloc: i.get<IStartupBloc>(),
              );
            },
        isSingleton: true,
        key: _startupScreenKey);
  }
}
