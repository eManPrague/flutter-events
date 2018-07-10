import 'package:flutter/widgets.dart';
import 'package:flutter_events/widget_factory.dart';

class EventsAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WidgetFactory().createScaffold(
        appBar: WidgetFactory().createAppBar(
          title: Text('Events'),
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
      title: 'Event\'s app',
      home: EventsAppHome(),
    );
  }
}

void main() => runApp(EventsApp());
