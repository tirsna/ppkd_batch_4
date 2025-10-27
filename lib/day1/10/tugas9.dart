import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day18/listmap.dart';
import 'package:ppkd_batch_4/day18/listmodel.dart';
import 'package:ppkd_batch_4/day18/listview.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _DrawerTugas9State();
}

class _DrawerTugas9State extends State<Tugas9> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [
    
  Listview(),
  Listmap(),
  Listmodel()
  
  
  
  ];
  void onTapDrawer(int index) {
    setState(() {
      selectedindex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Utama")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                // backgroundImage: AssetImage("assets/images/abe2.png"),
              ),
              title: Text("trisna"),
              subtitle: Text("CEO laguna"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.work),
              title: Text("ListView List"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.work),
              title: Text("ListView Map"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.work),
              title: Text("ListView Model"),
            ),
          ],
        ),
      ),
      body: widgetOptions[selectedindex],
    );
  }
}
