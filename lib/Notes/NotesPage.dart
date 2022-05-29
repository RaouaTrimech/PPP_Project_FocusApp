import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/UnicornOutlineButton.dart';

class NotesPage extends StatefulWidget{
  @override
  createState() => _NotesPage();

}
class _NotesPage extends State<NotesPage>{
  @override
  Widget build(BuildContext context) {
    Future openDialogSave()=>showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            elevation: 10.0,
            scrollable: true,
            actions: [
              new FlatButton.icon(
                onPressed: () => Navigator.pop(context), label: Text("back",style: TextStyle(color: Colors.white),), icon: Icon(Icons.exit_to_app,color: Colors.white,),
              ),
            ],
            backgroundColor: Colors.grey[900],
            content:SaveNote()
        )
    );
    return SingleChildScrollView(
      child:
      Stack(
        children:[Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("All Notes,", style: TextStyle(color:Color(0xFF7A6CF2),fontSize: 52,fontFamily: "Spartan",fontWeight:FontWeight.w700),),
                        Text("In One Place",style: TextStyle(color:Colors.white,fontSize: 32,fontFamily: "Spartan",fontWeight:FontWeight.w700),)
                      ],),
                    Column(children: [
                      GestureDetector(
                        onTap:()=>{
                          openDialogSave()
                        },
                        child:
                        Image.asset("assets/images/plus.png"),
                      )
                    ],)
                  ],
                ),
              ),
              SizedBox(height:20),
              NoteBox(title:"Note 1", description:"Note Body Note Body Note Body "),
              NoteBox(title:"Note 2", description:"Another Note Body Note Body Note Body "),
              NoteBox(title:"Note 3", description:"third Note Body Note Body Note Body "),
              NoteBox(title:"Note 4", description:"fourth Note Body Note Body Note Body ")
            ],
          ),
        ),

          Positioned(
              right:8,
              top:100,
              child:
              Image.asset("assets/images/notes.png"))],

      ),
    );
  }

}

class NoteBox extends StatelessWidget{
  String title;
  String description;
  NoteBox({Key? key, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return 
      Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.9,

          margin: EdgeInsets.all(10),
          padding:EdgeInsets.all(20) ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  colors: [Color(0xFF5C24FC), Color(0xFFB427D6)])
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(color:Colors.white,
                      fontSize: 25,fontFamily: "Spartan",fontWeight:FontWeight.w700)),
              Text(description,
                  style: TextStyle(color:Colors.white,
                      fontSize: 15,fontFamily: "Urbanist",fontWeight:FontWeight.w600)),
              SizedBox(height:10),Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text:"Modify"),
                  MyButton(text:"Delete"),
                ],
              )
            ],

          ),
        )],
    );
  }
}

class MyButton extends StatelessWidget{
  String text;
  MyButton({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    Future openDialogModify()=>showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          elevation: 10.0,
          scrollable: true,
            actions: [
              new FlatButton.icon(
                onPressed: () => Navigator.pop(context), label: Text("back",style: TextStyle(color: Colors.white),), icon: Icon(Icons.exit_to_app,color: Colors.white,),
              ),
            ],
            backgroundColor: Colors.grey[900],
            content: ModifyNote()
        )
    );
    Future openDialogDelete()=>showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            elevation: 10.0,
            scrollable: true,
            actions: [
              new FlatButton(
                onPressed: () => Navigator.pop(context),child: Text("Yes",style: TextStyle(color: Colors.white) ),
              ),
              new FlatButton(
                onPressed: () => Navigator.pop(context),child: Text("No",style: TextStyle(color: Colors.white)),
              ),
            ],
            backgroundColor: Colors.grey[900],
            content: Text("Are you sure?",style: TextStyle(color: Colors.white),)
        )
    );
    return
      GestureDetector(
        onTap: ()=>{
          if(text=="Modify"){
            openDialogModify()
          }
          else if(text=="Delete"){
            openDialogDelete()
          }
        },
        child: Container(
        width:110,
        height:27,

        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(245),
          border: Border.all(
            color: Colors.white,
            width: 2,// red as border color
          ),
        ),
        child:
        Center(
          child: Text(text,style: TextStyle(color:Colors.white,
              fontSize: 14,fontFamily: "Urbanist",fontWeight:FontWeight.w600),),
        ),
    ),
      );

  }

}

class ModifyNote extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text("Modify Note", style: TextStyle(fontFamily: "Spartan",fontWeight: FontWeight.w700,
      fontSize: 25,color: Color(0xC87A6CF2).withOpacity(0.8)
  ),),
  SizedBox(height:20),
  CustomizedInput(title:"Title",placeholder:"What I focused on"),
  CustomizedInput(title:"Description",placeholder:"Today I focused on..."),
  SizedBox(
    height:30,
  ),
  Center(
    child: SizedBox(
      width: 120,
      height:30,
      child: UnicornOutlineButton(
        strokeWidth: 2.0,
        radius: 24.0,
        gradient: LinearGradient(colors: [Colors.grey, Color(0xFF7A6CF2)]),
        child: Text('Save', style: TextStyle(fontSize: 14.0,fontFamily:"Spartan",color: Colors.white)),
          onPressed: () => Navigator.pop(context),
      ),
    ),
  ),
],
      ),
    );
  }
}

class SaveNote extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Save Note", style: TextStyle(fontFamily: "Spartan",fontWeight: FontWeight.w700,
              fontSize: 25,color: Color(0xC87A6CF2).withOpacity(0.8)
          ),),
          SizedBox(height:20),
          CustomizedInput(title:"Title",placeholder:"What I focused on"),
          CustomizedInput(title:"Description",placeholder:"Today I focused on..."),
          SizedBox(
            height:30,
          ),
          Center(
            child: SizedBox(
              width: 120,
              height:30,
              child: UnicornOutlineButton(
                strokeWidth: 2.0,
                radius: 24.0,
                gradient: LinearGradient(colors: [Colors.grey, Color(0xFF7A6CF2)]),
                child: Text('Save', style: TextStyle(fontSize: 14.0,fontFamily:"Spartan",color: Colors.white)),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomizedInput extends StatelessWidget{
  String title, placeholder;
  CustomizedInput({Key? key,required this.title,required this.placeholder });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Color(0xFF7A6CF2),
          decoration:
          InputDecoration(
              hintStyle: TextStyle(fontSize: 15, fontFamily:"Spartan",color: Colors.grey),
              hintText: placeholder,
              labelText: title,
              labelStyle: new TextStyle(
                color: Colors.white,
                fontFamily: "Spartan",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            focusColor: Colors.white
          ),
        ),
        SizedBox(height:20)
      ],
    );
  }


}