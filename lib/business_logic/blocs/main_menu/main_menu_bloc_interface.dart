
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';

abstract class IMainMenuBloc extends BlocBase {
  void onNewGameButton();
  void onSettingsButton();
  void onPokedexButton();
}