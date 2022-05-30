import 'package:flutter/material.dart';

import '../db/focusApp_database.dart';
import 'Event.dart';

class EventProvider1 extends StatefulWidget {
  const EventProvider1({Key? key}) : super(key: key);

  @override
  State<EventProvider1> createState() => _EventProvider1State();
}

class _EventProvider1State extends State<EventProvider1> implements ChangeNotifier{
  late List<Event> _events ;
  bool isLoading = false;

  @override
  void initState(){
    refreshEvents();
  }


  Future refreshEvents() async {
    this._events = await FocusAppDatabase.instance.readAllEvents();
  }

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events;

  Future<void> addEvent(Event event) async {
    _events.add(event);
    await FocusAppDatabase.instance.createE(event);
    notifyListeners();
  }

  Future<void> editEvent(Event newEvent , Event oldEvent) async {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;
    await FocusAppDatabase.instance.updateE(newEvent);

    notifyListeners();
  }
  void deleteEvent(Event event){
    _events.remove(event);

    notifyListeners();
  }









//////////////////////////
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
