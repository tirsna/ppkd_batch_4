import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  String? Produk;
  final List<String> listBarang = ["perkakas", "fashion", "Makanan"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pilih Katergori Produk"),
        DropdownButton(
          value: Produk,
          items: listBarang.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(val, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              Produk = value;
            });
            print(Produk);
          },
        ),
        Container(
          width: double.infinity,
          height: 100,
          color: Produk == "Pakaian"
              ? const Color.fromARGB(255, 89, 126, 30)
              : Produk == "Elektronik"
              ? Colors.tealAccent
              : const Color.fromARGB(255, 104, 104, 104),
        ),
        Text("Anda memilih : $Produk"),
      ],
    );
  }
}
