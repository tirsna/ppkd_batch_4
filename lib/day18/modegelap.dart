import 'package:flutter/material.dart';

class Modegelap extends StatefulWidget {
  const Modegelap({super.key});

  @override
  State<Modegelap> createState() => _ModegelapState();
}

class _ModegelapState extends State<Modegelap> {
  bool ismodegelap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ismodegelap
          ? Colors.black
          : const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Text(
            "aktifkan modegelap cik",
            style: TextStyle(
              color: ismodegelap
                  ? Colors.black
                  : const Color.fromARGB(255, 243, 243, 243),
            ),
          ),
          Switch(
            value: ismodegelap,
            onChanged: (value) {
              setState(() {
                ismodegelap = value;
              });
            },
          ),
          Text(
            ismodegelap ? "modegelap aktif" : "mode terang aktif",
            style: TextStyle(
              color: ismodegelap
                  ? Colors.black
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: ismodegelap
                ? Colors.black
                : const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}
