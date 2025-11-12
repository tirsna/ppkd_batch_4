
import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day18/appimeage.dart';
import 'package:ppkd_batch_4/day19/daftarui.dart';
import 'package:ppkd_batch_4/penyambut.dart';
import 'package:ppkd_batch_4/day18/latihan_splas.dart';

class SplashScreenDay18 extends StatefulWidget {
  const SplashScreenDay18({super.key,required this.email,
    required this.nama,
    required this.kota,});
final String email;
  final String nama;
  final String kota;
  @override
  State<SplashScreenDay18> createState() => _SplashScreenDay18State();
}

class _SplashScreenDay18State extends State<SplashScreenDay18> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HalamanPenyambut(email: '',nama: '',kota: '')),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DaftarUi()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.adidas)),
          Text(
            "Adidas Apps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}