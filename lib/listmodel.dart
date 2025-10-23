import 'package:flutter/material.dart';
import 'package:ppkd_batch_4/appimeage.dart';
import 'package:ppkd_batch_4/model_sepatu.dart';
import 'package:ppkd_batch_4/rupiah.dart';

class Listmodel extends StatefulWidget {
  const Listmodel({super.key});

  @override
  State<Listmodel> createState() => _ListmodelState();
}

class _ListmodelState extends State<Listmodel> {
  final List<ModelSepatu> namaspatu = [
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.adidas,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.nike,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.eiger,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.cow,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.nikeglas,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.y3k,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.lelaki,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.dino,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.bebek,
    ),
    ModelSepatu(
      name: "Sepatu adidas",
      price: 1000,
      condition: "ori",
      image: AppImages.hiu,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("list spatu", style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: namaspatu.length,
              itemBuilder: (context, index) {
                final item = namaspatu[index];
                return ListTile(
                  onTap: () {},
                  leading: Image.asset(item.image, width: 66),
                  title: Text(item.name),
                  subtitle: Text(item.price.toString().toRPCurrency()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
