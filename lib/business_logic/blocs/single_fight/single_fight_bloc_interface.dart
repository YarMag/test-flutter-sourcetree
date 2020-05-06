import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/fight/fight_state_model.dart';

abstract class ISingleFightBloc extends BlocBase {
  Stream<FightStateModel> outFightState;
  Sink<AbilityModel> inPlayerSelectedAbility;

  void onLeaveFight();
}
