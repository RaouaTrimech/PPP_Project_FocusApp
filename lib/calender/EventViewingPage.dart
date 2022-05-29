import 'package:example/calender/Event.dart';
import 'package:example/calender/EventEditingPage.dart';
import 'package:example/db/focusApp_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'EventProvider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    backgroundColor: Colors.grey[900],
    appBar: AppBar(
      backgroundColor:  Color.fromRGBO(244, 71, 113, 1),
      leading: CloseButton(),
      actions: buildViewingActions(context,event),
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children: [
        SizedBox(height: 20),
        Text(
          event.title,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
        Divider(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),
        SizedBox(height: 40),
        buildDateTime(event),
        SizedBox(height: 40),

        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(244, 71, 113, 1), width: 0.8),
          ),
          child: Text(
            event.description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        )
      ],
    ),
  );

  Widget buildDateTime(Event event) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            buildDate(event.isAllDay?'All-day' : 'From', event.from),
            SizedBox(height: 30),
            if (!event.isAllDay) buildDate('To', event.to),
    ]
    ,
    );
  }
    Widget buildDate(String title, DateTime date){
      final date1 = DateFormat.yMMMEd().format(date);
      final time = DateFormat.Hm().format(date);

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$date1  - $time",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      );
  }

  List<Widget> buildViewingActions(
      BuildContext context,
      Event event ,
      )=> [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => EventEditingPage(event: event),
          ),),
      ),
      SizedBox(width: 3,),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.deleteEvent(event);
          await FocusAppDatabase.instance.delete(event.id!);
          Navigator.of(context).pop();
  }
        ),

  ];


}
