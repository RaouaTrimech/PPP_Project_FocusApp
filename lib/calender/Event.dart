import 'package:flutter/material.dart';

final String tableEvents = 'events';

class EventFields {
  static final List<String> values = [
    //we add all the fields
    id,title,description,from,to,isAllDay
    //id,title,description,from,to,backgroundColor,isAllDay
  ];
  static final String id = '_id' ;
  static final String title = 'title';
  static final String description = 'description';
  static final String from ='fromDate' ;
  static final String to = 'toDate';
  //static final String backgroundColor ='backgroundColor' ;
  static final String isAllDay ='isAllDay';
}

class Event {
  final int? id;
  final String title;
  final String description;
  final DateTime from ;
  final DateTime to ;
  //final Color backgroundColor ;
  final bool isAllDay;

  const Event({
    this.id,
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.isAllDay= false
  });

  Map<String, Object?> toJson() => {
    EventFields.id : id ,
    EventFields.title : title,
    EventFields.description : description,
    //DateTime
    EventFields.from : from.toIso8601String() ,
    EventFields.to : to.toIso8601String(),
    //boolean
    EventFields.isAllDay : isAllDay ? 1 : 0 ,

  };

  Event copy({
    int? id,
    String? title,
    String? description,
    DateTime? from ,
    DateTime? to ,
    bool? isAllDay,
}) =>
    Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      from: from ?? this.from ,
      to: to ?? this.to ,
      isAllDay: isAllDay ?? this.isAllDay,
    );

  static Event fromJson(Map<String,Object?> json) => Event(
    id: json[EventFields.id] as int?,
    title: json[EventFields.title] as String,
    description: json[EventFields.description] as String,
    //DateTime
    from: DateTime.parse(json[EventFields.from] as String),
    to: DateTime.parse(json[EventFields.to] as String),
    //boolean
    isAllDay: json[EventFields.isAllDay] == 1 ,

  );


}