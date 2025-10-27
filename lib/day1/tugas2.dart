import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    var icon = Icon(Icons.phone, color: const Color.fromARGB(255, 246, 247, 248), size: 20);
    return Scaffold(
      //baris1
      backgroundColor: const Color.fromARGB(255, 241, 226, 226),
      appBar: AppBar(title: Text("profil saya")),
      body: Column(
        children: [
          Text("[wangsa aditrisna]", style: TextStyle(fontSize: 40)), //baris2
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.mark_email_read_outlined,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 20,
                ),
              ),

              //baris2
              SizedBox(width: 20),
              Text(
                'wangsaaditrisna@gamail.com',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                ),
              ),
            ],
          ),

          //baris3
          Padding(padding: const EdgeInsets.all(17)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Spacer(),
                Icon(Icons.phone),
                Text(
                  '0812-3456-7890',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),

                // baris4
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 236, 225),
                  ),
                  child: const Text(
                    "siti stabilizer",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 95, 148),
                  ),
                  child: const Text(
                    "iwan rotasi",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Text("Deskripsi"),
            ),
          ),
          Container(
            height: 23,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 216, 112, 104),
                  Color.fromARGB(255, 48, 89, 89),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
