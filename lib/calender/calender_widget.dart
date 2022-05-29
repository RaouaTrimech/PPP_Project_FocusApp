
import 'package:example/calender/EventProvider.dart';
import 'package:example/calender/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'EventDataSource.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {

    final events = Provider.of<EventProvider>(context).events;

    return SfCalendarTheme(

      data: SfCalendarThemeData(
        allDayPanelColor: Colors.purple,
        timeTextStyle: TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),

        trailingDatesTextStyle: TextStyle(
          color: Color.fromRGBO(203, 195, 227, 1),
        ),
        headerTextStyle: TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),
        displayNameTextStyle: TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),
        timeIndicatorTextStyle: TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),
        selectionBorderColor: Color.fromRGBO(244, 71, 113, 1),
        weekNumberTextStyle: TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),

        agendaDayTextStyle: TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),
        agendaDateTextStyle:TextStyle(
          color: Color.fromRGBO(244, 71, 113, 1),
        ),

      ),
      child:     SfCalendar(
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border:
          Border.all(color: Color.fromRGBO(244, 71, 113, 1),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
        todayHighlightColor: Color.fromRGBO(244, 71, 113, 1),
        view: CalendarView.month,
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.transparent,
        dataSource: EventDataSource(events) ,
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context,listen: false);
          provider.setDate(details.date!);
          showModalBottomSheet(
              context: context,
              builder: (context) => TasksWidget()
          );

        },
      ),

    );

  }
}

/**/