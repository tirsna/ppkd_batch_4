import 'package:flutter/material.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Tugas7> {
  bool udin = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Checkbox(
            value: udin,
            onChanged: (value) {
              print(value);
              setState(() {
                udin = value!;
              });
            },
          ),
          Text(
            udin
                ? "lanjutkan pendaftarn diperbolehkan"
                : "anda belum bisa melanjautkan",
          ),
          ElevatedButton(
            onPressed: udin ? () {} : null,
            child: Text(
              udin
                  ? "saya metujui semua persyaratan yang berlaku"
                  : "maaf anda belum bisa melanjutkan",
            ),
          ),
        ],
      ),
    );
  }
}
