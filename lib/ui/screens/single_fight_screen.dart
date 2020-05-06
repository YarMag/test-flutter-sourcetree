import 'package:flutter/cupertino.dart';

class SingleFightScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingleFightScreenState();
}

class _SingleFightScreenState extends State<SingleFightScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Fight"),
      ),
      child: Column(
        children: <Widget>[Container()],
      ),
    );
  }
}
