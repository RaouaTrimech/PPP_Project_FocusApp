import 'package:example/calender/calender_widget.dart';
import 'package:flutter/material.dart';

import 'EventEditingPage.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=> Scaffold(
    backgroundColor: Colors.grey[900],
    body: const CalendarWidget(),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add,color: Colors.white,),
      backgroundColor: const Color.fromRGBO(244, 71, 113, 1),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EventEditingPage())
      ),
    ),
  ) ;
}
