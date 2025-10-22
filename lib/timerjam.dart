import 'package:flutter/material.dart';

class Timerjam extends StatefulWidget {
  const Timerjam({super.key});

  @override
  State<Timerjam> createState() => _TimerjamState();
}

class _TimerjamState extends State<Timerjam> {
  TimeOfDay? selebew;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("atur timer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              selebew == null
                  ? "timer belum dipilih"
                  : "timer sudah dipilih pada ${selebew!.format(context)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 22),
          ElevatedButton(
            child: Text("pilih timer"),
            onPressed: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
            },
          ),
        ],
      ),
    );
  }
}
