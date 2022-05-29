// ignore_for_file: prefer_const_constructors

import 'package:example/Notes/NotesPage.dart';
import 'package:example/Onboarding.dart';
import 'package:example/calender/EventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calender/calender_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child:  MaterialApp(
    title: 'Focus App',
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
      accentColor: Colors.white,
      primaryColor: Color.fromRGBO(244, 71, 113, 1),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(43, 48, 62, 1)),
    ),
    home: Onboarding(),
  ),
  );

}

/* void main() {
  runApp(
      MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('focus app'),
      centerTitle: true,
      backgroundColor: Colors.indigo[200],
    ),
    body: Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: const Center(
        child: Text(
          'hello',
        ),
      ),
    ),
  ))
      );
} */
