import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sudoku_table.dart';

import 'animated_solve_button.dart';
import 'keypad.dart';
import 'options_row.dart';

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blue background at top of the screen
        // Using [FractionallySizedBox] so that is always takes up ~1/3 of screen height
        Center(
          child: Column(
            children: [
            FractionallySizedBox(
            widthFactor: 0.8,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                      "Sudoku",
                      style: GoogleFonts.spartan(
                          color:  Color.fromRGBO(231, 212, 183, 1.0),
                          fontWeight: FontWeight.w600,
                          fontSize: 36)
            ),
                ),
              )),
              FractionallySizedBox(
                widthFactor: 0.92,
                child: OptionsRow(),
              ),
              Spacer(),
              FractionallySizedBox(
                widthFactor: 0.92,
                child: SudokuTable(),
              ),
              Spacer(flex: 2),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: KeyPad(),
              ),
              Spacer(flex: 2),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: AnimatedSolveButton(),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
