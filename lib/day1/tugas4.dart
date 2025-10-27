import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 254),
      appBar: AppBar(
        title: Text(
          "G-reen Earth",
          style: TextStyle(color: Color.fromARGB(121, 0, 0, 0)),
        ),
        backgroundColor: Color.fromRGBO(2, 1, 0, 0.059),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama bro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "masukin nama lu di sini..",
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "e-mail",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "nih di sini masukin imel lu",
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "No-hp",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukin no hp, ga usah geer",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "deskripsikan diri luh",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: ".......",
                  ),
                ),
                // daftar barang
                SizedBox(height: 19),
                ListTile(
                  //meong beler
                  tileColor: Color(0xffE6CFA9),
                  leading: Image.asset('assets/images/beler.jpg'),
                  title: Text('kucing beler', style: TextStyle(fontSize: 20)),
                  subtitle: Text('15.000.000', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                SizedBox(height: 19),
                ListTile(
                  //meong punk
                  tileColor: Color(0xffE6CFA9),
                  leading: Image.asset('assets/images/kucing cool.jpg'),
                  title: Text('kucing punk', style: TextStyle(fontSize: 20)),
                  subtitle: Text('155.000.000', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                SizedBox(height: 19),
                ListTile(
                  //meong ngopi
                  tileColor: Color(0xffE6CFA9),
                  leading: Image.asset('assets/images/beler.jpg'),
                  title: Text('kucing beler', style: TextStyle(fontSize: 20)),
                  subtitle: Text('15.000.000', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                SizedBox(height: 19),
                ListTile(
                  //meong mgopi
                  tileColor: Color(0xffE6CFA9),
                  leading: Image.asset('assets/images/beler.jpg'),
                  title: Text('kucing beler', style: TextStyle(fontSize: 20)),
                  subtitle: Text('15.000.000', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                SizedBox(height: 19),
                ListTile(
                  //meong mgopi
                  tileColor: Color(0xffE6CFA9),
                  leading: Image.asset('assets/images/beler.jpg'),
                  title: Text('kucing beler', style: TextStyle(fontSize: 20)),
                  subtitle: Text('15.000.000', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
