import 'package:example/Articles/ArticleDisplay.dart';
import 'package:flutter/material.dart';
import 'package:example/Articles/TwoSideRoundedButton.dart';

class ReadingListCard extends StatelessWidget {
  final String image;
  final String title;
  final String auth;
  final String content;
  final String preview;

  void Function()? pressDetails;
  void Function()? pressRead;

 ReadingListCard({
    Key? key,
    required this.image,
    required this.title,
    required this.auth,
   required this.content,
   required this.preview,
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:SizedBox.fromSize(
                size: Size.fromRadius(55), // Image radius
                child: Image.asset(
                  image,
                  height: 150,
                  fit: BoxFit.fill,
                  width: 150,
                ),
              ),
            ),
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
                    padding: EdgeInsets.only(left: 15),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Colors.pink),
                        children: [
                          TextSpan(
                            text: "$auth\n",
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              elevation: 10.0,
                              scrollable: true,
                              actions: [
                                Text(
                                  preview,
                                  style: TextStyle(fontSize:16,color: Colors.white),
                                ),
                                new FlatButton(
                                  onPressed: () => Navigator.pop(context),child: Text("back",style: TextStyle(color: Colors.pink)),
                                ),
                              ],
                              backgroundColor: Colors.grey[900],
                              content: Text(title,style: TextStyle(fontSize:15,color: Colors.pink),)
                          ),
                            )
                          );

                        },
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Preview", style: TextStyle(
                            color: Colors.pink,
                            decoration: TextDecoration.underline,
                          ),),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ArticleDisplay(image: image, title: title, content: content, auth: auth)),
                            );
                          },
                          child: TwoSideRoundedButton(
                            text: "Read",
                            //article will have a name, author, cover and icon
                          ),
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
