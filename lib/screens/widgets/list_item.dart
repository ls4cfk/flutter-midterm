import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.brand,
      required this.model,
      required this.year,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  final String brand;
  final String model;
  final int year;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 150,
                image: NetworkImage(imageUrl),
                placeholder: const AssetImage("images/car_placeholder.png"),
              ),
              Text(brand),
              Text(year.toString())
            ],
          )),
    );
  }
}
