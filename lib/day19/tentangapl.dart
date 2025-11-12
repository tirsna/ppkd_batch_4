import 'package:flutter/material.dart';

class Tentangapl extends StatefulWidget {
  const Tentangapl({super.key});

  @override
  State<Tentangapl> createState() => _TentangaplState();
}

class _TentangaplState extends State<Tentangapl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tentang aplikasi ini")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("nama pembuat : WANGSA ADITRISNA")),
          Text("VERSI APK : 1.0"),
          Text("ini apk tugas broo"),
        ],
      ),
    );
  }
}
