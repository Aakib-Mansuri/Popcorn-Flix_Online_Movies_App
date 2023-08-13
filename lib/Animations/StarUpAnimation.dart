import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartUpAnimation
{
  Widget get(){
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black87.withOpacity(.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              radius: 73,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/Logo.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Popcorn Flix",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}