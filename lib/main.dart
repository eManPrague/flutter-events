import 'package:flutter/widgets.dart';
import 'package:flutter_events/events_localizations.dart';
import 'package:flutter_events/widget_factory.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EventsAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WidgetFactory().createScaffold(
        appBar: WidgetFactory().createAppBar(
          title: Text(EventsLocalizations.of(context).homeScreenTitle),
        ),
        body: Center(
          child: Text('Centered text'),
        ),
      );
}

class EventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetFactory().createAppWidget(
      onGenerateTitle: (context) => EventsLocalizations.of(context).appTitle,
      localizationsDelegates: [
        EventsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: EventsLocalizations.supportedLocales,
      home: EventsAppHome(),
    );
  }
}

void main() => runApp(EventsApp());
