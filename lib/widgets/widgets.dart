import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget appBar(BuildContext context){
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 22
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Quick',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54
            )
          ),
          TextSpan(
              text: 'Quiz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue
              )
          ),
        ]
      ),

    ),
  );
}


Widget blueButton(
    BuildContext context,
    String label
    ){
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 10
    ),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30)
    ),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width -48,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}