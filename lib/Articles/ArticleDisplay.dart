import 'package:flutter/material.dart';

class ArticleDisplay extends StatelessWidget {
  String image;
  String title;
  String auth;
  String content;
   ArticleDisplay({Key? key, required this.image , required this.title ,required this.content , required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3f3a47),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: IconButton(
                            color: Colors.white,
                            icon : Icon(Icons.keyboard_return_rounded , size: 40,),
                            onPressed: () { Navigator.pop(context); }
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                      image:  DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.pink[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                     textAlign: TextAlign.center,
                  ),
                   SizedBox(
                     height: 3,
                   ),
                   Text(
                    auth,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.purple[200],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text(
                      "Article",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,//.horizontal
                  child:  Text(
                      content,
                      style:  TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 15,
                      ),
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