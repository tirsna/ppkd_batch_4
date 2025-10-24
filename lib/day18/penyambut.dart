import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day18/daftarui.dart';

class HalamanPenyambutday18 extends StatefulWidget {
  const HalamanPenyambutday18({
    super.key,
    required this.email,
    required this.nama,
    required this.kota,
  });
  final String email;
  final String nama;
  final String kota;
  @override
  State<HalamanPenyambutday18> createState() => _HalamanPenyambutState();
}

class _HalamanPenyambutState extends State<HalamanPenyambutday18> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halo ${widget.nama}')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang!", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            const Text("Berikut adalah informasi Anda:"),
            Text("Nama: ${widget.nama}"),
            Text("Email: ${widget.email}"),
            Text("Kota: ${widget.kota}"),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarUi()),
                  (route) => false,
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
