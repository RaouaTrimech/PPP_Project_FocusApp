import 'package:example/Accueil/Accueil.dart';
import 'package:example/mind_games/tic_tac_toe_game/TicTacToeGameScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Sudoku_game/SudokuGame.dart';
import 'memory_game/MemoGameScreen.dart';

class RedirectGames extends StatelessWidget {
  const RedirectGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(

        child:Stack(
          children:[
            Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Games_Assets/gamesBackground.png"), fit: BoxFit.cover),
            ),
          ),
            Positioned.fill(

              child:Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () =>  Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back)),//arrow circld back
                    SizedBox(height: 30,),
                      //TIC TAC TOE
                      GestureDetector(
                        onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  TicTacToeGameScreen())),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 119,
                          width: 327,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF181A20).withOpacity(0.5),

                            border: Border.all(
                              width: 2,
                              color: Color(0xFF2B303E),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tic Tac Toe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Urbanist' ,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Image.asset('assets/Games_Assets/TicTacToeGame_Assets/TicTacToe.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      //MEMORY GAME
                      GestureDetector(
                        onTap: () =>  Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>  MemoGame())),
                        child: Container(
                        padding: EdgeInsets.all(10),
                        height: 119,
                        width: 327,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF181A20).withOpacity(0.5),
                          border: Border.all(
                            width: 2,
                            color: Color(0xFF2B303E),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/Games_Assets/MemoGame_Assets/memoryGame.png'),
                            Text(
                              'Memory Game',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Urbanist' ,
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                    ),
                      ),
                      SizedBox(height: 10,),
                      //SUDOKU
                      GestureDetector(
                        onTap: () =>  Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>  SudokuGame())),
                        child: Container(
                        padding: EdgeInsets.all(10),
                        height: 119,
                        width: 327,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF181A20).withOpacity(0.5),
                          border: Border.all(
                            width: 2,
                            color: Color(0xFF2B303E),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sudoku',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Urbanist' ,
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Image.asset('assets/Games_Assets/SudokuGame_Assets/sudoku.png'
                            ),
                          ],
                        ),
                    ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
