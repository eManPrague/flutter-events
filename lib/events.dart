import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/events_localizations.dart';
import 'package:flutter_events/models.dart';
import 'package:flutter_events/widget_factory.dart';
import 'package:intl/intl.dart' show DateFormat;

final format = DateFormat('yyyy-MM-dd HH:mm');

class EventListState extends State<EventList> {
  final _events = List<Event>();

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection('events')
        .orderBy('date_time')
        .snapshots()
        .listen((event) => setState(() {
              _events.clear();
              _events.addAll(event.documents.map((snapshot) => Event(
                    snapshot.data['name'],
                    DateTime.parse('${snapshot.data['date_time']}z'),
                    snapshot.data['description'],
                  )));
            }));
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
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
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
        ),
      ),
      onTap: () => _itemClicked(event),
    );
  }

  void _itemClicked(Event event) {
    Navigator.of(context).push(WidgetFactory()
        .createPageRoute(builder: (context) => EventDetail(event)));
  }
}

class EventList extends StatefulWidget {
  @override
  State<EventList> createState() => EventListState();
}

class EventDetail extends StatelessWidget {
  final Event _event;

  EventDetail(this._event);

  @override
  Widget build(BuildContext context) {
    return WidgetFactory().createScaffold(
      appBar: WidgetFactory().createAppBar(
        title: Text(EventsLocalizations.of(context).detailScreenTitle),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                _event.name,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              format.format(_event.dateTime),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[500],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: WidgetFactory().createDivider(),
            ),
            Text(
              _event.description,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
