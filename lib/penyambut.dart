import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day18/latihan_splas.dart';
import 'package:ppkd_batch_4/day19/db_helper.dart';
import 'package:ppkd_batch_4/day19/sclingfigma.dart';
import 'package:ppkd_batch_4/day19/user_model.dart';

class HalamanPenyambut extends StatefulWidget {
  const HalamanPenyambut({
    super.key,
    required this.email,
    required this.nama,
    required this.kota,
  });
  final String email;
  final String nama;
  final String kota;
  @override
  State<HalamanPenyambut> createState() => _HalamanPenyambutState();
}

class _HalamanPenyambutState extends State<HalamanPenyambut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halo ${widget.nama}')),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang!", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text("Berikut adalah informasi Anda:"),
            Text("Nama: ${widget.nama}"),
            Text("Email: ${widget.email}"),
            Text("Kota: ${widget.kota}"),
            FutureBuilder(
              future: DbHelper.getAllPelapor(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.username ?? ''),
                              subtitle: Text(items.email ?? ''),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Sclingfigma()),
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
