import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("profil saya")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // start
        //mainAxisAlignment: MainAxisAlignment.center, // center
        //mainAxisAlignment: MainAxisAlignment.spaceAround, // spaceAround
        //mainAxisAlignment: MainAxisAlignment.spaceBetween, // spaceBetween
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceEvenly
        //mainAxisAlignment: MainAxisAlignment.end, // end
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("[Nama lengkap]", style: TextStyle(fontSize: 20)),
          Text("Wangsa aditrisna"),
          // Text("S"),.
          // Text("A"),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Saya : "), Text("Wangsa aditrisna")],
          ),
          Row(children: [Icon(Icons.location_on), Text("jakarta")]),

          Column(
            children: [
              Text("deskripsi singkat"),
              Text(
                "sya seorang pelajar yang sedang belajar fluter, Suka makan nasi padang",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
