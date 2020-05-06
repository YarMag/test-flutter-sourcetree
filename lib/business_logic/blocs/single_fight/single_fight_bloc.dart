import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/blocs/single_fight/single_fight_bloc_interface.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/fight/fight_settings_model.dart';

  class SingleFightBloc extends ISingleFightBloc {
    final IFightService _fightService;

    final StreamController<FightStateModel> _fightStateController =
        StreamController<FightStateModel>();
    final StreamController<AbilityModel> _playerSelectedAbilityController =
        StreamController<AbilityModel>();

    Sink<FightStateModel> get _inFightState => _fightStateController.sink;
    Stream<FightStateModel> get outFightState => _fightStateController.stream;

    Sink<AbilityModel> get inPlayerSelectedAbility =>
        _playerSelectedAbilityController.sink;
    Stream<AbilityModel> get _outPlayerSelectedAbility =>
        _playerSelectedAbilityController.stream;

    SingleFightBloc({@required IFightService service})
        : this._fightService = service {}

    void onLeaveFight() {
      // TODO: implement
    }

    @override
    void dispose() {
      _fightStateController.close();
      _playerSelectedAbilityController.close();
    }
  }
