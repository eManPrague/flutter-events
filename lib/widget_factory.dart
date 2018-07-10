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

  Widget createAppWidget({
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Widget home,
    Iterable<LocalizationsDelegate> localizationsDelegates,
    Iterable<Locale> supportedLocales,
  });

  Widget createScaffold({PreferredSizeWidget appBar, Widget body});

  PreferredSizeWidget createAppBar({Widget title});

  Widget createDivider();

  Route createPageRoute({WidgetBuilder builder});
}

class _AndroidWidgetFactory implements WidgetFactory {
  @override
  Widget createAppWidget({
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Widget home,
    Iterable<LocalizationsDelegate> localizationsDelegates,
    Iterable<Locale> supportedLocales,
  }) {
    return MaterialApp(
      title: title,
      onGenerateTitle: onGenerateTitle,
      home: home,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

  @override
  Widget createScaffold({PreferredSizeWidget appBar, Widget body}) {
    return Scaffold(appBar: appBar, body: body);
  }

  @override
  PreferredSizeWidget createAppBar({Widget title}) {
    return AppBar(title: title);
  }

  @override
  Widget createDivider() => Divider();

  @override
  Route createPageRoute({WidgetBuilder builder}) {
    return MaterialPageRoute(builder: builder);
  }
}

class _IOSWidgetFactory implements WidgetFactory {
  @override
  Widget createAppWidget({
    String title = '',
    GenerateAppTitle onGenerateTitle,
    Widget home,
    Iterable<LocalizationsDelegate> localizationsDelegates,
    Iterable<Locale> supportedLocales,
  }) {
    return MaterialApp(
      title: title,
      onGenerateTitle: onGenerateTitle,
      home: home,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

  @override
  Widget createScaffold({PreferredSizeWidget appBar, Widget body}) {
    return CupertinoPageScaffold(navigationBar: appBar, child: body);
  }

  @override
  PreferredSizeWidget createAppBar({Widget title}) {
    return CupertinoNavigationBar(middle: title, backgroundColor: Colors.white);
  }

  @override
  Widget createDivider() => Divider();

  @override
  Route createPageRoute({WidgetBuilder builder}) {
    return MaterialPageRoute(builder: builder);
  }
}
