import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/Articles/ReadingListCard.dart';

import 'Articles.dart';

class Overview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Screen13.png"), fit: BoxFit.cover)),

      child: ListView(
        children:[
          Column(
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
          ArticleList(category:"Psychology"),
          ]
      ),
    )
    ;
  }


}

class ArticleList extends StatelessWidget{
  String category;
  ArticleList({Key? key,required this.category });

  Widget buildCards() {
    if(category == 'Philosophy'){
      return Row(
        children: [
          for( var art in philosophyArticles) ReadingListCard(
        image: art.image,
        title: art.title,
        auth: art.auth,
        content:art.content,
        preview: art.preview,
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
        ],
      );

    }else if(category == 'Astronomy'){
      return Row(
        children: [
          for( var art in astronomyArticles) ReadingListCard(
        image: art.image,
        title: art.title,
        auth: art.auth,
        content:art.content,
        preview: art.preview,
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
        ],
      );
    }else if(category == 'Science'){
      return Row(
        children: [
          for( var art in scienceArticles) ReadingListCard(
            image: art.image,
            title: art.title,
            auth: art.auth,
            content:art.content,
            preview: art.preview,
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
        ],
      );
    }else if(category == 'Psychology'){
      return Row(
        children: [
          for( var art in psychologyArticles) ReadingListCard(
            image: art.image,
            title: art.title,
            auth: art.auth,
            content:art.content,
            preview: art.preview,
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
        ],
      );
    }
    return Text('') ;
  }

  @override
  Widget build(BuildContext context) {
   return  Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[

       //Category Name
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
             buildCards(),
             SizedBox(width: 30),
           ],
         ),
       ),
     ]);
  }
}