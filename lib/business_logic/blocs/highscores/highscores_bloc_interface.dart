
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/highscores/highscore_model.dart';

abstract class IHighscoresBloc extends BlocBase {
  Future<List<HighscoreModel>> loadHighscores();
}