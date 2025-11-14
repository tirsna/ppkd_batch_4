import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_batch_4/day33/preferences/prefence_heandler.dart';
import 'package:ppkd_batch_4/day33/models/login.dart';
import 'package:ppkd_batch_4/day33/models/profile.dart';
import 'package:ppkd_batch_4/day33/models/register.dart';
// import 'package:ppkd_batch_4/day33/views/login_scren.dart';
// import 'package:ppkd_batch_4/day33/views/profile_scren.dart';

class Endpoint {
  static const String baseUrl = 'https://absensib1.mobileprojp.com';
  static const String register = '$baseUrl/api/register';
  static const String login = '$baseUrl/api/login';
  static const String profile = '$baseUrl/api/profile';
}

class AuthAPI {
  static Future<Registermodels> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);

    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type':
            'application/json', // Ditambahkan agar server tahu kirim JSON
      },
      body: json.encode({
        //.request.body.raw]
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    

    log('Register Response: ${response.body}');
    log('Register Status Code: ${response.statusCode}');

    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      //.response[0].code]
      return Registermodels.fromJson(responseBody);
    } else if (response.statusCode == 422) {
      //.response[1].code]
      final errors = responseBody['errors'] as Map<String, dynamic>;
      final firstError = errors.values.first[0];
      throw Exception(firstError);
    } else {
      throw Exception(responseBody['message'] ?? 'Terjadi kesalahan');
    }
  }

  static Future<Logginmodels> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);

    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email, 'password': password}),
    );

    log('Login Response: ${response.body}');
    log('Login Status Code: ${response.statusCode}');

    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      return Logginmodels.fromJson(responseBody);
    } else if (response.statusCode == 401 || response.statusCode == 404) {

      throw Exception(responseBody['message']);
    } else {
      throw Exception(responseBody['message'] ?? 'Terjadi kesalahan');
    }
  }

  static Future<Profilemodels> getProfile() async {
    final token = await PreferenceHandler.getToken();
    if (token == null) {
      throw Exception('Token tidak ditemukan. Silakan login kembali.');
    }

    final url = Uri.parse(Endpoint.profile);

    final response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    log('Get Profile Response: ${response.body}');
    log('Get Profile Status Code: ${response.statusCode}');

    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      return Profilemodels.fromJson(responseBody);
    } else if (response.statusCode == 401) {
      throw Exception(
        responseBody['message'] ?? 'Sesi berakhir. Silakan login kembali.',
      );
    } else {
      throw Exception(
        responseBody['message'] ?? 'Gagal mengambil data profil.',
      );
    }
  }

  static Future<Profilemodels> updateProfile({required String name}) async {
    final token = await PreferenceHandler.getToken();
    if (token == null) {
      throw Exception('Token tidak ditemukan. Silakan login kembali.');
    }

    final url = Uri.parse(Endpoint.profile);

    final response = await http.put(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'name': name}),
    );

    log('Update Profile Response: ${response.body}');
    log('Update Profile Status Code: ${response.statusCode}');

    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      return Profilemodels.fromJson(responseBody);
    } else if (response.statusCode == 422) {
      // Gagal validasi, misal: nama kosong
      final errors = responseBody['errors'] as Map<String, dynamic>;
      final firstError = errors.values.first[0];
      throw Exception(firstError);
    } else if (response.statusCode == 401) {
      throw Exception(
        responseBody['message'] ?? 'Sesi berakhir. Login kembali.',
      );
    } else {
      throw Exception(responseBody['message'] ?? 'Gagal memperbarui profil.');
    }
  }
}
