import 'package:flutter/material.dart';
import 'onboard_image.dart';

class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  Text("وَرَتِّلِ ٱلْقُرْءَانَ تَرْتِيلًا",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                        fontFamily: 'Kitab',
                        fontWeight: FontWeight.bold
                      )),
                ],
              ),
              const SizedBox(height: 20),

              //Image
              OnBoardImage(),
            ],
          ),
        ),
      ),
    );
  }
}
