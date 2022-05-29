import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/info_card.dart';
import 'game_utils/game_utils.dart';
import 'package:confetti/confetti.dart';

class MemoGame extends StatefulWidget {
   MemoGame({Key? key}) : super(key: key);

  @override
  _MemoGameState createState() => _MemoGameState();
}

class _MemoGameState extends State<MemoGame> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  final Game _game = Game();
  final controller = ConfettiController(duration: const Duration(seconds: 10));

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
    controller.stop();
  }

  @override
  void dispose(){
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading:IconButton(
          icon: const Icon(Icons.arrow_left_outlined ,size:50 ,color: Color.fromRGBO(231, 212, 183, 1.0),),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 5,
          ),
          ConfettiWidget(
            confettiController: controller,
          ),
          Center(
            child: Text(
              "Memory Game",
              style: GoogleFonts.spartan(
              color:  Color.fromRGBO(231, 212, 183, 1.0),
              fontWeight: FontWeight.w600,
              fontSize: 36)
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              info_card("Tries", "$tries"),
              info_card("Score", "$score"),
            ],
          ),
          Stack(
            alignment:  AlignmentDirectional.bottomEnd,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: _game.gameImg!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      padding: EdgeInsets.all(16.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(_game.matchCheck);
                            setState(() {
                              //incrementing the clicks
                              tries++;
                              _game.gameImg![index] = _game.cards_list[index];
                              _game.matchCheck
                                  .add({index: _game.cards_list[index]});
                              print(_game.matchCheck.first);
                            });
                            if (_game.matchCheck.length == 2) {
                              if (_game.matchCheck[0].values.first ==
                                  _game.matchCheck[1].values.first) {
                                print("true");
                                //incrementing the score
                                score += 100;
                                if(score == 400){
                                  controller.play();
                                }
                                _game.matchCheck.clear();
                              } else {
                                print("false");
                                Future.delayed(Duration(milliseconds: 500), () {
                                  print(_game.gameColors);
                                  setState(() {
                                    _game.gameImg![_game.matchCheck[0].keys.first] =
                                        _game.hiddenCardpath;
                                    _game.gameImg![_game.matchCheck[1].keys.first] =
                                        _game.hiddenCardpath;
                                    _game.matchCheck.clear();
                                  });
                                });
                              }
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(231, 140, 142, 1.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: ClipRRect( child : Image (image: AssetImage(_game.gameImg![index]),
                                fit: BoxFit.cover,))
                          ),
                        );
                      })),
              GestureDetector(
              onTap: () {
                setState(() {
                _game.resetGame();
                _game.initGame() ;
                tries = 0;
                score = 0;
                controller.stop();});
              },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16 , bottom: 16),
                  child: Container(
                    height: 100,
                    width: 100,
                   decoration: BoxDecoration(
                       color : const Color.fromRGBO(244, 71, 113, 1),
                   borderRadius: BorderRadius.circular(8.0)),
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Center(child: Text(
                         "RESET",
                         style: GoogleFonts.spartan(
                             color: Colors.white,
                             //Color.fromRGBO(203, 195, 227, 1),
                             fontWeight: FontWeight.bold,
                             fontSize: 15)
                     ),),
                   )),
                ),
              ),
            ],
          ),
          Stack(
            alignment:  AlignmentDirectional.bottomEnd,
            children: const [
              Padding(
                padding: const EdgeInsets.only(top : 8.0, right: 25),
                child: ClipRRect( child : Image (
                    image: AssetImage("assets/Games_Assets/MemoGame_Assets/BgImage.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 250),
                child: ClipRRect( child : Image (
                    image: AssetImage("assets/Games_Assets/MemoGame_Assets/BgImage3.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only( top: 30, right: 300),
                child: ClipRRect( child : Image (
                  height: 40, width: 40,
                    image: AssetImage("assets/Games_Assets/MemoGame_Assets/BgImage3_1.png"))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
