import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day18/latihan_splas.dart';
import 'package:ppkd_batch_4/day19/penyambut.dart';
import 'package:ppkd_batch_4/day19/db_helper.dart';
import 'package:ppkd_batch_4/day19/studenmodel.dart';
import 'package:ppkd_batch_4/day19/user_model.dart';
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
  final TextEditingController kota = TextEditingController();
  final TextEditingController nohp = TextEditingController();

  bool obscurepass = true;
  final passwordController = TextEditingController();

  final fromkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailcontroler.dispose();
    namacontroler.dispose();
    kota.dispose();
  }

  void checkformfield() {
    setState(() {
      isbuttonenable =
          emailcontroler.text.isNotEmpty &&
          namacontroler.text.isNotEmpty &&
          kota.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    //1
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              width: 345,
              height: 700,
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
                        //2
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
                          return 'emil tidak boleh kosong';
                        }
                        if (!RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        ).hasMatch(value)) {
                          return 'Format email tidak valid';
                        }
                        return null;
                        //3
                        // return null;
                      },
                    ),
                    Text("Password"),
                    const SizedBox(height: 4),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      obscureText: obscurepass,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Password anda',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurepass = !obscurepass;
                            });
                          },
                          icon: Icon(
                            obscurepass
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        if (value.length < 8) {
                          return 'Password minimal 8 karakter';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Text("no hp "),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: nohp,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "no hp",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor HP wajib diisi';
                        }
                        final RegExp phoneRegExp = RegExp(
                          r'^(?:\+62|0)[0-9]{8,14}$',
                        );

                        if (!phoneRegExp.hasMatch(value)) {
                          return 'Format nomor HP tidak valid';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Text("kota "),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: kota,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukan Kota",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: SizedBox(
                width: 30,
                height: 20,
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanPenyambut(
                            email: emailcontroler.text,
                            nama: namacontroler.text,
                            kota: kota.text,
                          ),
                        ),
                        (route) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("daftar berhasil")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("masukan semua data dengan benar"),
                        ),
                      );
                    }
                    print('Nama: ${namacontroler.text}');
                    print('Email: ${emailcontroler.text}');
                    print('Kota: ${kota.text}');
                    final UserModel dataStudent = UserModel(
                      username: namacontroler.text,
                      email: emailcontroler.text,
                      password: passwordController.text,
                      nohp: int.parse(nohp.text),
                      kota: kota.text,
                    );
                    DbHelper.registerUser(dataStudent);
                  },
                  child: Text(
                    "daftar",
                    style: TextStyle(
                      color: const Color.fromARGB(26, 255, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "have an account?",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(width: 1),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Sign In", style: TextStyle(color: Colors.blue)),
                ),
                 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
