import 'package:example/calender/Event.dart';
import 'package:example/calender/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EventProvider.dart';

class EventEditingPage extends StatefulWidget {

  final Event? event;

  const EventEditingPage({Key? key, this.event}) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState(){
    super.initState();

    if(widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }else{
      final event = widget.event!;
      titleController.text = event.title;
      descriptionController.text = event.description;
      fromDate = event.from;
      toDate = event.to;
    }
  }

  @override
  void dispose(){
    titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey[900],
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(244, 71, 113, 1),
      leading: const CloseButton() ,
      actions: buildEditingActions(),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 30,),
             buildTitle(),
             SizedBox(height: 50,),
            buildDateTimePickers(),
            SizedBox(height: 50,),
            buildDescription(),

          ],
        ),
      ),
    ),
  );

  List<Widget> buildEditingActions() => [
    ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(244, 71, 113, 1),
        shadowColor: Colors.transparent,
      ),
      icon: const Icon(Icons.done),
      label: const Text('SAVE'),
      onPressed: saveForm, //minute 7.02

    )
  ];

  Widget buildTitle() => TextFormField(
    style: const TextStyle(
        fontSize: 24,
        color: Colors.white
    ),
    cursorColor: Color.fromRGBO(244, 71, 113, 1),
    decoration: InputDecoration(

      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(244, 71, 113, 1),
          )
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )
      ),
      hintText: 'Add Title',
      hintStyle: TextStyle( color: Colors.white),
    ),
    onFieldSubmitted: (_) => saveForm(),
    validator: (title)=>
    title !=null && title.isEmpty ?'Title cannot be empty':null ,
    controller: titleController,
  );

  Widget buildDescription() => TextFormField(
    style: const TextStyle(fontSize: 17,
    color: Colors.white),
    cursorColor: Color.fromRGBO(244, 71, 113, 1),
    minLines: 3,
    maxLines: 10,
    decoration: InputDecoration(

      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(244, 71, 113, 1),
          )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        )
      ),
      hintText: 'Description',
      hintStyle: TextStyle( color: Colors.white),
    ),
    onFieldSubmitted: (_) => saveForm(),
    validator: (description)=>
    description !=null && description.isEmpty ?'Description':null ,
    controller: descriptionController,
  );

  Widget buildDateTimePickers() =>Column(
    children: [
      buildFrom(),
      SizedBox(height: 30,),
      buildTo(),
    ],
  );

  Widget buildFrom() => buildHeader(
    header: 'FROM',
    child: Row(
      children: [
        Expanded(
          flex: 2,
            child: buildDropdownField(
              text: Utils.toDate(fromDate),
              onClicked: () => pickFromDateTime(pickDate: true ),
            ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(fromDate),
            onClicked: () => pickFromDateTime(pickDate: false ),
          ),
        ),
      ],
    ),
  );
  Widget buildTo() => buildHeader(
    header: 'To',
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: buildDropdownField(
            text: Utils.toDate(toDate),
            onClicked: () => pickToDateTime(pickDate: true ),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(toDate),
            onClicked: () => pickToDateTime(pickDate: false ),
          ),
        ),
      ],
    ),
  );

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) => ListTile(
    title: Text(text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    trailing: Icon(Icons.arrow_drop_down , color: Colors.white,),
    onTap: onClicked,
  );

  Widget buildHeader({
    required String header,
    required Widget child}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        header,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400
        ),
      ),
      child,
    ],
  ) ;

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate,pickDate: pickDate);
    if (date == null) return ;

    if(date.isAfter(toDate)) {
      toDate = DateTime(date.year,date.month,date.day, toDate.hour ,toDate.minute);
    }

    setState(() => fromDate = date);

  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate,
        firstDate: pickDate ? fromDate : null);
    if (date == null) return ;

    setState(() => toDate = date);

  }

  Future<DateTime?>pickDateTime(
      DateTime initialDate, {
      required bool pickDate,
      DateTime? firstDate,
  }) async {
      if(pickDate){
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          //limitations of the Date picker
          firstDate: firstDate ?? DateTime(2015 ,8),
          lastDate: DateTime(2101),
            //widget colors :
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.dark(
                        onPrimary: Color.fromRGBO(203, 195, 227, 1), // selected text color
                        onSurface: Color.fromRGBO(244, 71, 113, 1), // default text color
                        primary: Color.fromRGBO(244, 71, 113, 1) // circle color
                    ),
                    dialogBackgroundColor: Colors.black45,
                    textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                fontFamily: 'Quicksand'),
                          primary: Color.fromRGBO(244, 71, 113, 1), // color of button's letters
                            backgroundColor: Colors.black12, // Background color
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(50))))),
                child: child!,
              );
            }
        );

        if (date == null) return null ;
        final time = Duration(hours: initialDate.hour , minutes: initialDate.minute);
        return date.add(time);
      }else{
        final timeOfDay = await showTimePicker(

            context: context,
            initialTime: TimeOfDay.fromDateTime(initialDate),
            builder: (context, child) {
              return Theme(
                data: ThemeData(
                  primaryColor: Color.fromRGBO(244, 71, 113, 1),
                  colorScheme: ColorScheme.dark(

                    onSecondary: Color.fromRGBO(203, 195, 227, 1),

                    onBackground: Color.fromRGBO(244, 71, 113, 1),
                    // change the border color
                    primary: Color.fromRGBO(244, 71, 113, 1.5),
                    // change the text color
                    onSurface: Color.fromRGBO(203, 195, 227, 0.7),
                  ),
                  // button colors
                  buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(
                      primary: Color.fromRGBO(244, 71, 113, 1),
                    ),
                  ),
                ),
                child: child!,
              );
            },
        );

        if(timeOfDay == null) return null ;
        final date = DateTime(initialDate.year,initialDate.month, initialDate.day);
        final time = Duration(hours: timeOfDay.hour , minutes: timeOfDay.minute);

        return date.add(time);
      }
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if(isValid) {

      final isEditing = widget.event != null;

      final provider = Provider.of<EventProvider>(context, listen: false);
      if (isEditing) {
        final event = Event(
          id: widget.event!.id,
          title: titleController.text,
          from: fromDate,
          to: toDate,
          description: descriptionController.text,
          isAllDay: false,
        );
        provider.editEvent(event,widget.event!);
        Navigator.of(context).pop();
      }else{
        final event = Event(
          title: titleController.text,
          from: fromDate,
          to: toDate,
          description: descriptionController.text,
          isAllDay: false,
        );
        provider.addEvent(event);
      }

      Navigator.of(context).pop();
    }
  }
}

