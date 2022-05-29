import 'package:example/calender/Event.dart';
import 'package:example/db/focusApp_database.dart';
import 'package:flutter/material.dart';

//where we will store our states
class EventProvider extends ChangeNotifier {
  List<Event> _events = [];

  bool isLoading = false;

  /*@override
  void initState(){
    refreshEvents();
  }*/


  Future refreshEvents() async {
    this._events = await FocusAppDatabase.instance.readAllEvents();
    notifyListeners();
  }

  List<Event> get events {
    refreshEvents();
    return _events;
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events;

  Future<void> addEvent(Event event) async {

     Event event1= await FocusAppDatabase.instance.create(event);
     this._events = await FocusAppDatabase.instance.readAllEvents();
    notifyListeners();

  }

  Future<void> editEvent(Event newEvent , Event oldEvent) async {
    final index = _events.indexOf(oldEvent);

    await FocusAppDatabase.instance.update(newEvent);

    notifyListeners();
  }
  void deleteEvent(Event event){
    _events.remove(event);

    notifyListeners();
  }


}