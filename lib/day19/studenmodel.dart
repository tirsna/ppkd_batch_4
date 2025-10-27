import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rakyatmodel {
  int? id;
  String nama;
  String kota;
  String kecamatan;
  int nohp;

  Rakyatmodel({
    this.id,
    required this.kecamatan,
    required this.nama,
    required this.kota,
    required this.nohp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
       'kecamatan':kecamatan,
      'domisili': kota,
      'nohp': nohp,
    };
  }

  factory Rakyatmodel.fromMap(Map<String, dynamic> map) {
    return Rakyatmodel(
      id: map['id'] as int,
      nama: map['nama'] as String,
      kota: map['kota'] as String,
      nohp: map['nohp'] as int,
      kecamatan: map['kecamatan'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rakyatmodel.fromJson(String source) =>
      Rakyatmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
