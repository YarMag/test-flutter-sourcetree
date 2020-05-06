import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/highscores/highscores_bloc_interface.dart';
import 'package:start_app/models/highscores/highscore_model.dart';

class HighscoresScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HighscoresScreenState();
}

class _HighscoresScreenState extends State<HighscoresScreen> {
  IHighscoresBloc _bloc;
  Future<List<HighscoreModel>> _highscores;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
    _highscores = _bloc.loadHighscores();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Highsсores"),
      ),
      child: FutureBuilder(
        future: _highscores,
        builder: (BuildContext context,
            AsyncSnapshot<List<HighscoreModel>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext nestedContext, int index) {
                        return Text(
                          "${snapshot.data[index].playerName} ----- ${snapshot.data[index].points}",
                          textAlign: TextAlign.center,
                        );
                      }),
                )
              ],
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
