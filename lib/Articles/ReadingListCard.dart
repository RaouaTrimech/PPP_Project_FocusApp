import 'package:flutter/material.dart';
import 'package:example/Articles/TwoSideRoundedButton.dart';

class ReadingListCard extends StatelessWidget {
  final String image;
  final String title;
  final String auth;

  void Function()? pressDetails;
  void Function()? pressRead;

 ReadingListCard({
    Key? key,
    required this.image,
    required this.title,
    required this.auth,

    this.pressDetails,
    this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            width: 150,
          ),

          Positioned(
            top: 160,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "$title\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: auth,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: pressDetails,
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(""),
                        ),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          text: "Read",
                          press: pressRead,
                          //article will have a name, author, cover and icon
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
