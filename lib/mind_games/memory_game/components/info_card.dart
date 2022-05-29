import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

Widget info_card(String title, String info) {
  return Expanded(
    child : Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(255, 226, 159, 1.0),
              Color.fromRGBO(255, 169, 159, 1.0),
              Color.fromRGBO(244, 113, 154, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(26.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 26.0),
         child: Column(
        children: [
          Text(
            title,
           style: GoogleFonts.urbanist(
               color: Color.fromRGBO(47, 47, 44, 1.0),
               //Color.fromRGBO(203, 195, 227, 1),
               fontWeight: FontWeight.w500,
               fontSize: 22)
          ),
          Text(
            info,
            style: GoogleFonts.urbanist(
              color: Color.fromRGBO(47, 47, 44, 1.0),
              //Color.fromRGBO(203, 195, 227, 1),
              fontWeight: FontWeight.bold,
              fontSize: 34),
          ),
        ],
      ),
    ),
  );
}
