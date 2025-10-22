import 'package:flutter/material.dart';

class CekboxWidget extends StatefulWidget {
  const CekboxWidget({super.key});

  @override
  State<CekboxWidget> createState() => _CekboxWidgetState();
}

class _CekboxWidgetState extends State<CekboxWidget> {
  bool isCek = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Checkbox(
            value: isCek,
            onChanged: (value) {
              print(value);
              setState(() {
                isCek = value!;
              });
            },
          ),
          Text(
            isCek
                ? "Lanjutkan pendaftaran diperbolehkan"
                : "Anda belum bisa melanjutkan",
          ),
          ElevatedButton(
            onPressed: isCek ? () {} : null,
            child: Text(
              isCek
                  ? "Saya menyetujui semua persyaratan yang berlaku"
                  : "Maaf anda belum bisa melanjutkan",
            ),
          ),
        ],
      ),
    );
  }
}
