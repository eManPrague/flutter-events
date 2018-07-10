import 'dart:io';

abstract class WidgetFactory {
  static WidgetFactory _instance;

  factory WidgetFactory() {
    if (_instance == null) {
      if (Platform.isAndroid) {
        _instance = _AndroidWidgetFactory();
      } else if (Platform.isIOS) {
        _instance = _IOSWidgetFactory();
      } else {
        throw UnsupportedError('Unsupported target platform.');
      }
    }
    return _instance;
  }
}

class _AndroidWidgetFactory implements WidgetFactory {}

class _IOSWidgetFactory implements WidgetFactory {}
