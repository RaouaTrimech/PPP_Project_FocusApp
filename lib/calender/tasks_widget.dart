import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'EventDataSource.dart';
import 'EventProvider.dart';
import 'EventViewingPage.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if(selectedEvents.isEmpty){
      return Container(
          color: Colors.grey[900],
          child: Center(

          child: Text(
            'No Events Found',
            style: TextStyle(
              color: Color.fromRGBO(244, 71, 113, 1),
              fontSize: 24,
            ),
          ),
        )

      );
    }

    return SfCalendarTheme(
        data: SfCalendarThemeData(
          selectionBorderColor: Color.fromRGBO(203, 195, 227, 1),
          timeTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        child: SfCalendar(
          backgroundColor: Colors.grey[900],
          todayHighlightColor: Color.fromRGBO(203, 195, 227, 1),
          cellBorderColor: Colors.transparent,
          headerStyle:CalendarHeaderStyle(
            textStyle: TextStyle(
                color:Color.fromRGBO(244, 71, 113, 1),
              fontSize: 30,
            )
          ),
          //time
          timeSlotViewSettings: TimeSlotViewSettings(
                     timeTextStyle: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.w300,
                         color: Colors.white,
                         fontStyle: FontStyle.italic)
               ),
          view: CalendarView.timelineDay,
          dataSource: EventDataSource(provider.events),
          initialDisplayDate: provider.selectedDate,
          appointmentBuilder: appointmentBuilder,
          onTap: (details) {
            if (details.appointments == null) return ;

            final event = details.appointments!.first;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventViewingPage(event: event ),
            ));

          },
        ));
  }
  Widget appointmentBuilder(
      BuildContext context,
      CalendarAppointmentDetails details,
      ){
    final event = details.appointments.first;
    return Container(
      padding: EdgeInsets.all(5),
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color:Color.fromRGBO(244, 71, 113, 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color.fromRGBO(203, 195, 227, 0.8),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
