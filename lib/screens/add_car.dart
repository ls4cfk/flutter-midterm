import 'package:flutter/material.dart';
import 'package:midterm/data/repository/car_helper.dart';
import 'package:midterm/data/models/cars_model.dart';
import 'package:midterm/screens/home_screen.dart';

class addCar extends StatefulWidget {
  static const routeName = "/add-car";

  const addCar({Key? key}) : super(key: key);

  @override
  _addCarState createState() => _addCarState();
}

class _addCarState extends State<addCar> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController imageUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: TextFormField(
                      controller: id,
                      decoration: const InputDecoration(hintText: "Enter id"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ID';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: brand,
                      decoration:
                          const InputDecoration(hintText: "Enter brand"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Brand';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: model,
                      decoration:
                          const InputDecoration(hintText: "Enter model"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter model';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: year,
                      decoration: const InputDecoration(hintText: "Enter year"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter year';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: description,
                      decoration:
                          const InputDecoration(hintText: "Enter description"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: imageUrl,
                      decoration:
                          const InputDecoration(hintText: "Enter imageUrl"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter imageUrl';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("back")),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Car car = Car(
                                  id: int.parse(id.text),
                                  brand: brand.text,
                                  model: model.text,
                                  year: int.parse(year.text),
                                  description: description.text,
                                  imageUrl: imageUrl.text);
                              CarRepository().addCar(car);
                              Navigator.pushNamed(
                                  context,
                                  homeScreen
                                      .routeName); // ეს არ უნდა იყოს მთლად სწორი გადაწყვეტილება მარა მარტივი გამოსავალია ;დ როგორ უნდა გამეკეთებინა მოვისმენ სიამოვნებით.
                            }
                          },
                          child: const Text("Add"))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
