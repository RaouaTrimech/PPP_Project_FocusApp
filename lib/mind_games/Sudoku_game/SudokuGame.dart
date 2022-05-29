import 'package:example/mind_games/Sudoku_game/screens/solve_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Accueil/Accueil.dart';
import 'constants/example_boards.dart';
import 'models/sudoku_grid.dart';

class SudokuGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SudokuGrid>(
      create: (context) => SudokuGrid.fromTemplate(easyBoard),
      child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          leading:IconButton(
            icon: const Icon(Icons.arrow_left_outlined ,size:50 ,color:   Color.fromRGBO(244, 71, 113, 1),),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
    backgroundColor: Colors.grey[900],
    body: SolveScreen(),
    ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
