
import 'package:flutter/cupertino.dart';
import 'package:start_app/creational_patterns/abstract_factory/widget_factory.dart';

class CupertinoWidgetsFactory extends WidgetFactory {
  Widget createApp(Widget rootWidget) {
    return CupertinoApp(
      home: rootWidget,
      // other configuration if needed
    );
  }

  Widget createButton(String title, Function onPressed) {
    return CupertinoButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }

  Widget createText(String value) {
    return Text(value);
  }

}