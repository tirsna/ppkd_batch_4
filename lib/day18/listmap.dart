import 'package:flutter/material.dart';

class Listmap extends StatefulWidget {
  const Listmap({super.key});

  @override
  State<Listmap> createState() => _ListmapState();
}

class _ListmapState extends State<Listmap> {
  final List<Map<String, dynamic>> namaSayur = [
    {'nama': "Buah-buahan", 'Icon': Icons.apple},
    {'nama': "Minuman", 'Icon': Icons.local_drink},
    {'nama': "Sayuran", 'Icon': Icons.spa},
    {'nama': "Elektronik", 'Icon': Icons.devices},
    {'nama': "Pakaian Pria", 'Icon': Icons.man},
    {'nama': "Pakaian Wanita", 'Icon': Icons.woman},
    {'nama': "Alat Tulis Kantor", 'Icon': Icons.edit},
    {'nama': "Buku & Majalah", 'Icon': Icons.menu_book},
    {'nama': "Peralatan Dapur", 'Icon': Icons.kitchen},
    {'nama': "Makanan Ringan", 'Icon': Icons.fastfood},
    {'nama': "Mainan Anak", 'Icon': Icons.toys},
    {'nama': "Peralatan Olahraga", 'Icon': Icons.sports_basketball},
    {'nama': "Produk Kesehatan", 'Icon': Icons.health_and_safety},
    {'nama': "Kosmetik", 'Icon': Icons.brush},
    {'nama': "Obat-obatan", 'Icon': Icons.local_pharmacy},
    {'nama': "Aksesoris Mobil", 'Icon': Icons.directions_car},
    {'nama': "Perabot Rumah", 'Icon': Icons.weekend},
    {'nama': "Sepatu & Sandal", 'Icon': Icons.directions_run},
    {'nama': "Barang Bekas", 'Icon': Icons.restore},
    {'nama': "Voucher & Tiket", 'Icon': Icons.confirmation_num},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("list kategori", style: TextStyle(fontSize: 22)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: namaSayur.length,
              itemBuilder: (BuildContext context, index) {
                final item = namaSayur[index];
                return ListTile(
                  leading: Icon(item['Icon']),
                  title: Text(item['nama']),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("kamu memilih ${item['nama']}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
