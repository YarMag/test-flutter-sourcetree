import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class PokedexScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  IPokedexBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Pokedex"),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 250,
              child: CupertinoTextField(
                onChanged: (String value) => _bloc.inPokemonSearch.add(value),
                suffix: Icon(CupertinoIcons.search),
                suffixMode: OverlayVisibilityMode.always,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: StreamBuilder(
                stream: _bloc.outPokemonSearchResults,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PokemonModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  return Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Text(snapshot.data[index].name)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
