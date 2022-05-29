import 'package:example/mind_games/tic_tac_toe_game/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';

class TicTacToeGameScreen extends StatefulWidget {

  @override
  _TicTacToeGameScreenState createState() => _TicTacToeGameScreenState();
}

class Player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

class _TicTacToeGameScreenState extends State<TicTacToeGameScreen> {
  static final countMatrix = 3;
  static final double size = 92;
  final controller = ConfettiController(duration: const Duration(seconds: 6));
  String lastMove = Player.none;
  late List<List<String>> matrix;

  @override
  void initState() {
    super.initState();
    setEmptyFields();
    controller.stop();
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
    countMatrix,
        (_) => List.generate(countMatrix, (_) => Player.none),
  ));

  Color getBackgroundColor() {
    final thisMove = lastMove == Player.X ? Player.O : Player.X;

    return getFieldColor(thisMove);
  }
// getBackgroundColor
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          leading:IconButton(
            icon: const Icon(Icons.arrow_left_outlined ,size:50 ,color:  Color.fromARGB(0xFF, 0x8B, 0x78, 0xFF),),
            onPressed: () => Navigator.of(context).pop(),
          ),
      ),
    backgroundColor: Colors.grey[900],
    body : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      SizedBox(
      height: 50,
    ),
    ConfettiWidget(
      confettiController: controller,
    ),
    Center(
      child: Text(
          "Tic Tac Toe",
          style: GoogleFonts.spartan(
              color:  getBackgroundColor(),
              fontWeight: FontWeight.w600,
              fontSize: 36)
      ),
    ),
    SizedBox(
      height: 50,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
    ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ClipRRect( child : Image (
                    image: AssetImage("assets/Games_Assets/TicTacToeGame_Assets/BgImage4.png"))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( left: 40),
              child: ClipRRect( child : Image (
                  image: AssetImage("assets/Games_Assets/MemoGame_Assets/BgImage3.png"))),
            ),
            Padding(
              padding: const EdgeInsets.only( left: 250,top: 100),
              child: ClipRRect( child : Image (
                  width: 80,
                  image: AssetImage("assets/Games_Assets/MemoGame_Assets/BgImage3.png"))),
            ),
          ],
        )])
  );

  Widget buildRow(int x) {
    final values = matrix[x];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        values,
            (y, value) => buildField(x, y),
      ),
    );
  }

  Color getFieldColor(String value) {
    switch (value) {
      case Player.O:
        return Color.fromARGB(0xFF, 0x8B, 0x78, 0xFF);
      case Player.X:
        return Color.fromRGBO(244, 71, 113, 1);
      default:
        return Colors.white;
    }
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];
    final color = getFieldColor(value);

    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size, size),
          primary: color,
        ),
        child: Text(value, style: TextStyle(fontSize: 32)),
        onPressed: () => selectField(value, x, y),
      ),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      final newValue = lastMove == Player.X ? Player.O : Player.X;

      setState(() {
        lastMove = newValue;
        matrix[x][y] = newValue;
      });

      if (isWinner(x, y)) {
        showEndDialog('Player $newValue Won !',newValue);
        controller.play();
      } else if (isEnd()) {
        showEndDialog('Undecided Game','');
      }
    }
  }

  bool isEnd() =>
      matrix.every((values) => values.every((value) => value != Player.none));

  /// Check out logic here: https://stackoverflow.com/a/1058804
  bool isWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix[x][y];
    final n = countMatrix;

    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) col++;
      if (matrix[i][y] == player) row++;
      if (matrix[i][i] == player) diag++;
      if (matrix[i][n - i - 1] == player) rdiag++;
    }

    return row == n || col == n || diag == n || rdiag == n;
  }

  Future showEndDialog(String title,String winner) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Center(child: Text(title,
          style: GoogleFonts.spartan(
          color:  (winner != '') ? getFieldColor(winner) : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20))),
      content: GestureDetector(
          onTap: () {
            setEmptyFields();
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(255, 226, 159, 1.0),
                  Color.fromRGBO(255, 169, 159, 1.0),
                  Color.fromRGBO(244, 113, 154, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(12.0),
            child: Center(child: Text(
                "RESTART",
                style: GoogleFonts.spartan(
                    color: Colors.white,
                    //Color.fromRGBO(203, 195, 227, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15)
            ),),
          ),
        )
    ),
  );
}
