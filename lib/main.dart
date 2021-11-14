import 'package:flutter/material.dart';
import 'package:midterm/screens/edit_car.dart';
import 'screens/screens.dart';
import 'screens/car_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homeScreen(),
      routes: {
        addCar.routeName: (ctx) => addCar(),
        editCar.routeName: (ctx) => editCar(),
        CarDetails.routeName: (ctx) => CarDetails(),
        homeScreen.routeName: (ctx) => homeScreen()
      },
    );
  }
}
