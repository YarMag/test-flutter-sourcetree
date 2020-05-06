import 'package:flutter/material.dart';
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';


abstract class BlocContextBase<T extends BlocBase> {

  void subscribe(T bloc, BuildContext context);
}
