
import 'package:flutter/widgets.dart';

abstract class WidgetFactory {
  Widget createApp(Widget rootWidget);
  Widget createButton(String title, Function onPressed);
  Widget createText(String value);
}