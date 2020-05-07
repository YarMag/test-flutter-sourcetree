import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/main_menu/main_menu_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc_interface.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';

typedef BlocProvider<IMainMenuBloc> MainScreenBuilder();

typedef BlocProvider<INewFightBloc> NewFightScreenBuilder();

typedef BlocProvider<ISingleFightBloc> SingleFightScreenBuilder(FightSettingsModel settings);

typedef BlocProvider<IHighscoresBloc> HighscoresScreenBuilder();

typedef BlocProvider<IPokedexBloc> PokedexScreenBuilder();

typedef BlocProvider<IStartupBloc> StartupScreenBuilder();