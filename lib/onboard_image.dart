import 'package:flutter/material.dart';
import 'package:quran/home.dart';

class OnBoardImage extends StatelessWidget {
  const OnBoardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 350,
      child: Stack(
        children: [
          //Image
          Container(
            padding: const EdgeInsets.only(left: 17,bottom: 20),
            height: 400,
            width: 350,
            margin: const EdgeInsets.only(right: 20),
            child: ClipRRect(
    borderRadius: BorderRadius.circular(40.0),
    child: Image.asset("assets/images/4.jpg",
        height: 150.0,
        width: 100.0,
        fit: BoxFit.fill,
    ),
)
          ),
          // Button
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Home()));
              },
              child: Container(
                height: 50,
                width: 140,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:  Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("Get Started",style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
