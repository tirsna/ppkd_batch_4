import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GREEN EARTH',
          style: TextStyle(color: Color.fromARGB(255, 1, 92, 46)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Nama'),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "masukan E-mail anda....",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "no-hp",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "masukan no-hp anda..",
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "deskripsikan diri anda..",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLines: 2,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "......",
                  ),
                ),
                SizedBox(height: 13),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 9,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 236, 16, 9),
                      child: Stack(children: [const Text("1")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 80, 241, 5),
                      child: Stack(children: [const Text("2")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 2, 63, 116),
                      child: Stack(children: [const Text("3")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 212, 5, 231),
                      child: Stack(children: [const Text("4")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 233, 5, 5),
                      child: Stack(children: [const Text("5")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 230, 196, 3),
                      child: Stack(children: [const Text("6")]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Stack(children: [const Text("7")]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
