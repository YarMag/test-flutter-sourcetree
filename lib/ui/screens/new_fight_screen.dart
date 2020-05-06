import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/di/builders.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/ui/widgets/new_fight/difficulty_selection_control.dart';
import 'package:start_app/ui/widgets/new_fight/player_pokemon_avatar.dart';
import 'package:start_app/ui/widgets/new_fight/pokemons_grid.dart';

class NewFightScreen extends StatefulWidget {
  final SingleFightScreenBuilder _singleFightScreenBuilder;

  NewFightScreen({@required singleFightScreenBuilder})
      : this._singleFightScreenBuilder = singleFightScreenBuilder;

  @override
  State<StatefulWidget> createState() => _NewFightScreenState();
}

class _NewFightScreenState extends State<NewFightScreen> {
  INewFightBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Fight settings"),
      ),
      child: SafeArea(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                StreamBuilder(
                  initialData: _bloc.getFightSettings(),
                  stream: _bloc.outSettings,
                  builder: (BuildContext context,
                      AsyncSnapshot<FightSettingsModel> snapshot) {
                    final FightSettingsModel settings = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        PlayerPokemonAvatar(NewFightPlayerType.player,
                            settings.playerPokemon, "You"),
                        DifficultySelectionControl(),
                        PlayerPokemonAvatar(
                            NewFightPlayerType.cpu, settings.cpuPokemon, "CPU")
                      ],
                    );
                  },
                ),
                StreamBuilder(
                  stream: _bloc.outGridPokemons,
                  initialData: _bloc.getPokemonsGridContent(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PokemonModel>> snapshot) {
                    return PokemonsGrid(snapshot.data);
                  },
                ),
                CupertinoButton(
                    child: Text("Start fight"),
                    onPressed: () => Navigator.push(context,
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return widget._singleFightScreenBuilder(_bloc.getFightSettings());
                        })))
              ],
            )
      ),
    );
  }
}
