import 'package:flutter/material.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool showName = false;
  bool showFavorite = false;
  bool showAll = false;
  num counter = 0;
  bool showKotak = false;
  double counter1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFBF9D1),
      appBar: AppBar(
        title: Text(
          "Tugas 5 Flutter",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff9A3F3F),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showName) ...[
              Text(
                "Yoga Perdana Ferdiansyah",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  print("Tampilkan Nama : $showName");
                  showName = !showName;
                  setState(() {});
                },
                child: Text(showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
              ),
            ] else ...[
              SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  print("Tampilkan Nama : $showName");
                  showName = !showName;
                  setState(() {});
                },
                child: Text(showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
              ),
            ],
            IconButton(
              onPressed: () {
                showFavorite = !showFavorite;
                setState(() {});
              },
              icon: Icon(
                showFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ),
            Text(showFavorite ? "Disukai" : " "),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    showAll
                        ? 'inilsjdksjdgkjhsbkgjhbsd skhfdbgkhsfkhbsdkghjbsdkgjhsbdkdf sfglnsdgnsjdfngsfg sdfkjhsdfjlhsdf'
                        : '    ',
                    maxLines: 3,
                  ),
                  TextButton(
                    onPressed: () {
                      showAll = !showAll;
                      setState(() {});
                    },
                    child: Text('Lihat Selengkapnya'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: Text(counter.toString(), style: TextStyle(fontSize: 24)),
              ),
            ),

            InkWell(
              onTap: () {
                print('Kotak Sentuh');
                setState(() {
                  showKotak = !showKotak;
                });
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: Color(0xffE6CFA9),
                child: Center(
                  child: Text(
                    showKotak ? '  ' : 'Alhamdulillah ada teks nya',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onDoubleTap: () {
                print('Ditekan dua kali');
                setState(() {
                  counter1 += 2;
                });
              },
              onLongPress: () {
                print('Tahan Lama');
                setState(() {
                  counter1 += 3;
                });
              },
              onTap: () {
                print('ditekan sekali');
                setState(() {
                  counter1++;
                });
              },
              child: Text('Tekan Aku'),
            ),
            Center(child: Text('Jumlahnya : $counter1')),
          ],
        ),
      ),
    );
  }
}
