import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';

class DifficultySelectionControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DifficultySelectionControlState();
}

class _DifficultySelectionControlState
    extends State<DifficultySelectionControl> {
  INewFightBloc _bloc;

  int _selectedIndex = 1;

  Map<int, Widget> difficultiesWidgets = {
    0: Text("Easy"),
    1: Container(
      width: 55,
      child: Text("Normal", textAlign: TextAlign.center),
    ),
    2: Text("Hard")
  };

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl(
      onValueChanged: (int index) {
        _selectedIndex = index;
        _bloc.inDifficulty.add(Difficulty.values[index]);
      },
      groupValue: _selectedIndex,
      children: difficultiesWidgets,
    );
  }
}
