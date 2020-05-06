import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/startup/startup_bloc_interface.dart';
import 'package:start_app/di/builders.dart';
import 'package:start_app/ui/constants/images.dart';

class StartupScreen extends StatefulWidget {
  final MainScreenBuilder _mainScreenBuilder;

  StartupScreen({@required MainScreenBuilder mainScreenBuilder})
      : this._mainScreenBuilder = mainScreenBuilder;

  @override
  State<StatefulWidget> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  IStartupBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
    _bloc.startup();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _bloc.isInitialized,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data) {
          Future.microtask(() => Navigator.pushReplacement(context, CupertinoPageRoute(
            builder: (BuildContext context) => widget._mainScreenBuilder()
          )));
        }
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                child: FittedBox(
                  child: Images.startupScreen(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: CupertinoActivityIndicator(),
            )
          ],
        );
      },
    );
  }
}
