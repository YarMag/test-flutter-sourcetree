import 'package:start_app/business_logic/blocs/common/base_bloc.dart';

abstract class IStartupBloc extends BlocBase {

  void startup();

  Future<bool> isInitialized;
}