import 'package:flutter/material.dart';

class LahirWidget extends StatefulWidget {
  const LahirWidget({super.key});

  @override
  State<LahirWidget> createState() => _LahirWidgetState();
}

class _LahirWidgetState extends State<LahirWidget> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(selectedPicked.toString()),

          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                print(picked);
                setState(() {
                  selectedPicked = picked;
                });
              }
            },
            child: Text("Pilih Tanggal Lahir"),
          ),
          Text("Tanggal Lahir : $selectedPicked"),
        ],
      ),
    );
  }
}
