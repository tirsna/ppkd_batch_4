import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/latihan_splas.dart';
import 'package:ppkd_batch_4/penyambut.dart';

class DaftarUi extends StatefulWidget {
  const DaftarUi({super.key});

  @override
  State<DaftarUi> createState() => _DaftarUiState();
}

class _DaftarUiState extends State<DaftarUi> {
  bool isbuttonenable = false;
  final TextEditingController namacontroler = TextEditingController();
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController domcontroler = TextEditingController();
  final fromkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailcontroler.dispose();
    namacontroler.dispose();
    domcontroler.dispose();
  }

  void checkformfield() {
    setState(() {
      isbuttonenable =
          emailcontroler.text.isNotEmpty &&
          namacontroler.text.isNotEmpty &&
          domcontroler.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Container(
              width: 345,
              height: 550,
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: fromkey,
                child: Column(
                  children: [
                    Text(
                      "formulir",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("nama "),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: namacontroler,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "masukan nama anda",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Wajib Di Isi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Text("email"),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: emailcontroler,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "masukan email anda",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email tidak boleh kosong';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'format email tidak valid';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Text("nomor telpon"),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "masukan nomor telpon anda",
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff1D61E7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (fromkey.currentState!.validate()) {
                              PreferenceHandler.saveLogin(true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HalamanPenyambut(
                                    email: emailcontroler.text,
                                    nama: namacontroler.text,
                                    kota: domcontroler.text,
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("daftar berhasil")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "masukan semua data dengan benar",
                                  ),
                                ),
                              );
                            }
                            print('Nama: ${namacontroler.text}');
                            print('Email: ${emailcontroler.text}');
                            print('Kota: ${domcontroler.text}');
                          },
                          child: Text(
                            "daftar",
                            style: TextStyle(color: Colors.white10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
