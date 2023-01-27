// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  List surah;
  int ayahCount;
  String surahName;
  Read(
      {Key? key,
      required this.surah,
      required this.ayahCount,
      required this.surahName})
      : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  String bsmalah =  "بسم الله الرحمن الرحيم";
  List<String>? ayah;
  List<int>? ayahNum;
  ArabicNumbers arabicNumbers = ArabicNumbers();
  @override
  void initState() {
    ayahNum = getAyahNum();
    ayah = getAyah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
          //      color: Colors.red,
                  padding: const EdgeInsets.only(top: 50),
                 // color: Colors.white,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: header(),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.purple,
                        ),
                        child: RichText(
                            textAlign: widget.ayahCount <= 20
                                ? TextAlign.center
                                : TextAlign.justify,
                            text: TextSpan(children: [
                              for (var i = 0; i < widget.ayahCount; i++)...{
                                TextSpan(
                                  text: ' ${ayah![i]} ',
                                  style: const TextStyle(
                                    fontFamily: 'lateef',
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                WidgetSpan(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: ayahNum![i] > 99 ? 19 : 15,
                                    child: Text(
                                      '${arabicNumbers.convert(ayahNum![i])}',
                                      style: const TextStyle(
                                        fontFamily: 'Kitab',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                      //textScaleFactor:
                                        //  i.toString().length <= 2 ? 1 : 8,
                                    ),
                                  ),
                                )
                              }
                            ])),
                      )
                    ],
                  ))));
  
  }

  List<String> getAyah() {
    List<String> ayah = [];
    for (var i = 0; i < widget.surah.length; i++) {
      ayah.add(widget.surah[i]['text']);
    }
    return ayah;
  }

  List<int> getAyahNum() {
    List<int> ayah = [];
    for (var i = 0; i < widget.surah.length; i++) {
      ayah.add(widget.surah[i]['id']);
    }
    return ayah;
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 71, 2, 83),
                    Color.fromARGB(255, 187, 61, 209),
                  ],
                  begin: FractionalOffset(0.0, 1.0),
                  end: FractionalOffset(0.7, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
      ),
      child: Column(
        children: [
          Text(
            widget.surahName,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          widget.surahName != "التوبة"
              ? Text(
                  bsmalah,
                  textAlign: TextAlign.center,
                  
                  style: const TextStyle(fontSize: 24, color: Colors.white,fontFamily: 'amiri'),
                )
              : const Text(
                  "",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
        ],
      ),
    );
  }
}
