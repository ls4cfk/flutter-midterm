import 'package:flutter/material.dart';
import 'package:midterm/data/models/cars_model.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key}) : super(key: key);
  static const routeName = "/details-car";

  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context)!.settings.arguments as Car;

    return Scaffold(
        appBar: AppBar(title: const Text("Details")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 150,
                  image: NetworkImage(car.imageUrl),
                  placeholder: const AssetImage("images/car_placeholder.png"),
                ),
                Text(car.brand),
                Text(car.year.toString()),
                Text(car.description)
              ],
            ),
          ),
        ));
  }
}
