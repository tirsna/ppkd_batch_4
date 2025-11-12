import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ppkd_batch_4/day32/models/rickmorty_model.dart';

Future<List<Result>> fetchRickMorty() async {
  final response = await http.get(
    Uri.parse("https://rickandmortyapi.com/api/character"),
  );

  if (response.statusCode == 200) {
    final data = RickMorty.fromJson(json.decode(response.body));
    return data.results ?? [];
  } else {
    throw Exception("Gagal memuat data Rick & Morty");
  }
}
