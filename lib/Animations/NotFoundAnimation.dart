import 'package:flutter/material.dart';

class NotFoundAnimation extends StatelessWidget {
  const NotFoundAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black87.withOpacity(.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/NotAvailable.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Not Available",
                style: TextStyle(
                    fontSize: 25,
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