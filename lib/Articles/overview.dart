import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/Articles/ReadingListCard.dart';

class Overview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Screen13.png"), fit: BoxFit.cover)),

      child: ListView(
        children:[Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(text: "What articles to \nread "),
                    TextSpan(
                        text: "today?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

          ],),
        ArticleList(category:"Philosophy"),
          ArticleList(category:"Astronomy"),
          ArticleList(category:"Science"),
          ArticleList(category:"Psycology"),
          ]
      ),
    )
    ;
  }


}

class ArticleList extends StatelessWidget{
  String category;
  ArticleList({Key? key,required this.category });
  @override
  Widget build(BuildContext context) {
   return  Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[

       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 24),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(category,style: TextStyle(color: Color(0xFFF44771).withOpacity(0.8),fontSize: 24,fontWeight: FontWeight.bold),),

           ],
         ),
       )
       ,SizedBox(height: 30),
       SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child: Row(
           children: <Widget>[
             ReadingListCard(
               image: "assets/images/book-1.png",
               title: "Crushing & Influence",
               auth: "Gary Venchuk",

               //pressDetails: () {
               //     Navigator.push(
               //     context,
               //     MaterialPageRoute(
               //     builder: (context) {
               //     return DetailsScreen();
               //     },
               //     ),
               //     );
               //     },
             ),
             ReadingListCard(
               image: "assets/images/book-2.png",
               title: "Top Ten Business Hacks",
               auth: "Herman Joel",

             ),
             SizedBox(width: 30),
           ],
         ),
       ),
     ]);
  }
}