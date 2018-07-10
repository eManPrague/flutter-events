import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/models.dart';
import 'package:flutter_events/widget_factory.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:lorem/lorem.dart';

class EventListState extends State<EventList> {
  static final format = DateFormat('yyyy-MM-dd HH:mm');
  static final lorem = Lorem();

  final _events = List<Event>();

  @override
  void initState() {
    super.initState();
    _events.addAll(generateWordPairs().take(10).map((pair) => Event(
          pair.asPascalCase,
          DateTime.now(),
          lorem.createParagraph(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: _events.length * 2,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return WidgetFactory().createDivider();
          } else {
            return _buildItem(_events[index ~/ 2]);
          }
        });
  }

  Widget _buildItem(Event event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            event.name,
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ),
        Text(
          format.format(event.dateTime),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}

class EventList extends StatefulWidget {
  @override
  State<EventList> createState() => EventListState();
}
