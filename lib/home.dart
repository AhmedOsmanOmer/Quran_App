// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/readpage.dart';
import 'package:quran/surah.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/quran.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text('قران كريم',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Kitab',
                    )),
              ),
              ListTile(
                title: const Text('Share App'),
                leading: const Icon(Icons.share),
                onTap: () {},
              ),
              ListTile(
                  title: const Text('About Us'),
                  leading: const Icon(Icons.people),
                  onTap: () {}),
              ListTile(
                title: const Text('Contact Us'),
                leading: const Icon(Icons.contact_page),
                onTap: () {},
              ),
              const ListTile(
                  title: Text('Ahmed Osman Omer'),
                  subtitle: Text("Mobile Application Developer")),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          actions: [
            Transform.rotate(
              angle: isReverse ? pi : 2 * pi,
              child: IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () {
                    setState(() {
                      isReverse = !isReverse;
                    });
                  }),
            ),
          ],
        ),
        body: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 187, 61, 209),
                          Color.fromARGB(255, 71, 2, 83),
                        ],
                        begin: FractionalOffset(0.0, 1.0),
                        end: FractionalOffset(0.3, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "القران الكريم",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Kitab',
                      ),
                    ),
                    Image.asset('assets/images/quran_icon.png')
                  ],
                ),
              ),
              Expanded(
                child: surahList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : chaptersList(
                        isReverse ? surahList.reversed.toList() : surahList),
              )
            ])));
  }

  ///////////////
  ///
  ///
  Widget chaptersList(List<Surah> chapters) {
    return ListView.separated(
      controller: _controller,
      itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 5, left: 7, right: 7),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 71, 2, 83),
                    Color.fromARGB(255, 187, 61, 209),
                  ],
                  begin: FractionalOffset(0.0, 1.0),
                  end: FractionalOffset(0.7, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(50)),
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  chapters[index].id.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              title: Text(
                chapters[index].name,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                chapters[index].versesCount.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                chapters[index].arabicName,
                style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Read(
                      surah: chapters[index].verses,
                      ayahCount: chapters[index].versesCount,
                      surahName: chapters[index].arabicName,
                    ),
                  ),
                );
              })),
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemCount: chapters.length,
    );
  }
}
