import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Tugas5> {
  bool nama = false;
  bool favorite = false;
  bool showall = false;
  num counter = 0;
  bool showkotak = false;
  double counter1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 238, 190),
      appBar: AppBar(
        title: Text(
          "tugas 5",
          style: TextStyle(color: Color.fromARGB(132, 0, 0, 0)),
        ),
        backgroundColor: Color.fromARGB(255, 252, 253, 253),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 20,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),

      body: Column(
        children: [
          Text("Nama saya :"),
          if (nama) Text("trisna"),
          TextButton(
            onPressed: () {
              print("tampilkan nama");
              nama = !nama;
              setState(() {});
            },

            child: Text(nama ? "tampilkan nama" : "sembunyikan nama"),
          ),
          IconButton(
            onPressed: () {
              favorite = !favorite;
              setState(() {});
            },
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          ),
          Text(favorite ? "ga ush pencet-pencet" : ""),
          SizedBox(
            child: Column(
              children: [
                Text(
                  showall ? '    ' : 'emjfvergfkghsyuftfgfgyesfgetyfdyt',
                  maxLines: 3,
                ),
                TextButton(
                  onPressed: () {
                    showall = !showall;
                    setState(() {});
                  },
                  child: Text('lihat lengkap'),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Center(
                    child: Text(
                      counter.toString(),
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 200,
                  color: Color.fromARGB(134, 543, 233, 32),
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        splashColor: Color.fromARGB(14, 4, 2, 87),
                        onTap: () {
                          print("kotak di sentuh");
                          showkotak = !showkotak;
                          setState(() {});
                        },
                        child: Center(child: Text(showkotak ? "anjyyy" : "")),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                GestureDetector(
                  onDoubleTap: () {
                    print('ditekan dua kali coy');
                    setState(() {
                      counter1 += 3;
                    });
                  },
                  onLongPress: () {
                    print('tekan lama');
                    setState(() {
                      counter1 += 3;
                    });
                  },
                  onTap: () {
                    print('ditekan sekali aj');
                    setState(() {
                      counter1++;
                    });
                  },
                  child: Text('tekan aku'),
                ),
                Center(child: Text('jumlah nya : $counter1')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
