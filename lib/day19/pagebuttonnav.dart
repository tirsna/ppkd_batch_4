import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day19/tentangapl.dart';
import 'package:ppkd_batch_4/day1/10/tugas7.dart';

class Pagebuttonnav extends StatefulWidget {
  const Pagebuttonnav({super.key});

  @override
  State<Pagebuttonnav> createState() => _PagebuttonnavState();
}

class _PagebuttonnavState extends State<Pagebuttonnav> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [
    
    Tugas7flutterWidget(),
    Tentangapl(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (index) {
          print(index);
          setState(() {
            selectedindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "tentang aplikasi",
          ),
        ],
      ),
      body: widgetOptions[selectedindex],
    );
  }
}
