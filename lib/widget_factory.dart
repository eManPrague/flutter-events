import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  Widget createAppWidget({String title, Widget home});

  Widget createScaffold({PreferredSizeWidget appBar, Widget body});

  PreferredSizeWidget createAppBar({Widget title});
}

class _AndroidWidgetFactory implements WidgetFactory {
  @override
  Widget createAppWidget({String title, Widget home}) {
    return MaterialApp(title: title, home: home);
  }

  @override
  Widget createScaffold({PreferredSizeWidget appBar, Widget body}) {
    return Scaffold(appBar: appBar, body: body);
  }

  @override
  PreferredSizeWidget createAppBar({Widget title}) {
    return AppBar(title: title);
  }
}

class _IOSWidgetFactory implements WidgetFactory {
  @override
  Widget createAppWidget({String title, Widget home}) {
    return MaterialApp(title: title, home: home);
  }

  @override
  Widget createScaffold({PreferredSizeWidget appBar, Widget body}) {
    return CupertinoPageScaffold(navigationBar: appBar, child: body);
  }

  @override
  PreferredSizeWidget createAppBar({Widget title}) {
    return CupertinoNavigationBar(middle: title);
  }
}
