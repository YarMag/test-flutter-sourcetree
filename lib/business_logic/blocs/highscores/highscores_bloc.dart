
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc_interface.dart';
import 'package:start_app/models/highscores/highscore_model.dart';

class HighscoresBloc extends IHighscoresBloc {

  @override
  Future<List<HighscoreModel>> loadHighscores() {
    return Future.delayed(const Duration(seconds: 2), () => [
      HighscoreModel(playerName: "Helen", points: 623.42),
      HighscoreModel(playerName: "John", points: 457.65),
      HighscoreModel(playerName: "Kathrine", points: 250.00),
      HighscoreModel(playerName: "Nick", points: 123.45),
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
