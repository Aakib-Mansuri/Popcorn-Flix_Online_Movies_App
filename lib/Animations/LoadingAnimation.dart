import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget
{
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(.7),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(), // Loading circle
              SizedBox(height: 10), // Add some spacing between the loading circle and text
              Text(
                "Fetching Data......",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
