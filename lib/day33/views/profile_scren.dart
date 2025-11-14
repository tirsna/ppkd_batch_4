import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/day18/latihan_splas.dart';
import 'package:ppkd_batch_4/day33/models/profile.dart';
import 'package:ppkd_batch_4/day33/models/register.dart';
import 'package:ppkd_batch_4/day33/service/api.dart';
import 'package:ppkd_batch_4/day33/views/edit_profile.dart';
import 'package:ppkd_batch_4/day33/views/login_scren.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Profilemodels> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = AuthAPI.getProfile();
  }

  // Fungsi untuk Logout
  Future<void> _handleLogout() async {
    await PreferenceHandler.removeLogin();

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreenNew()),
        (route) => false, // Hapus semua riwayat navigasi
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        backgroundColor: Colors.blue.shade600,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: 'Logout',
          ),
        ],
      ),
      backgroundColor: Color(0xFFF0F8FF),
      body: Center(
        child: FutureBuilder<Profilemodels>(
          future: _profileFuture,
          builder: (context, snapshot) {
            // Kondisi Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            // Kondisi Error
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${snapshot.error.toString().replaceAll('Exception: ', '')}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red.shade800, fontSize: 16),
                ),
              );
            }
            // Kondisi sukses
            if (snapshot.hasData) {
              final user = snapshot.data!.data;
              if (user == null) {
                return Text('Gagal memuat data pengguna.');
              }

              // Tampilkan data profil
              return _buildProfileCard(user);
            }

            return Text('Tidak ada data.');
          },
        ),
      ),
    );
  }

  Widget _buildProfileCard(User user) {
    return Container(
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue.shade100,
            child: Icon(Icons.person, size: 50, color: Colors.blue.shade800),
          ),
          SizedBox(height: 24),
          Text(
            user.name ?? 'Nama Tidak Tersedia',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            user.email ?? 'Email Tidak Tersedia',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade700),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(user: user),
                ),
              );

              if (result == true) {
                setState(() {
                  _profileFuture = AuthAPI.getProfile();
                });
              }
            },
            icon: Icon(Icons.edit_outlined),
            label: Text('Edit Profil'),

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
