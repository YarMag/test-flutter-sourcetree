
import 'package:flutter/material.dart';
import 'package:start_app/creational_patterns/abstract_factory/widget_factory.dart';

class MaterialWidgetsFactory extends WidgetFactory {
  Widget createApp(Widget rootWidget) {
    return MaterialApp(
      home: rootWidget,
    );
  }

  Widget createButton(String title, Function onPressed) {
    return MaterialButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }

  Widget createText(String value) {
    return Text(value);
  }
}