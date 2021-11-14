import 'package:flutter/material.dart';
import 'package:midterm/data/dummy_data.dart';
import 'package:midterm/data/models/cars_model.dart';
import 'package:midterm/data/repository/car_helper.dart';
import 'package:midterm/screens/add_car.dart';
import 'package:midterm/screens/car_details.dart';
import 'package:midterm/screens/edit_car.dart';
import 'package:midterm/screens/widgets/list_item.dart';

class homeScreen extends StatefulWidget {
  static const routeName = "/home";
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<Car> carList = DUMMY_DATA;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cars")),
      drawer: Drawer(),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            final car = carList[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: GestureDetector(
                  onLongPress: () => Navigator.pushNamed(
                          context, editCar.routeName,
                          arguments: {"car": car, "index": index}).then((_) {
                        setState(() {});
                      }),
                  onTap: () => Navigator.pushNamed(
                      context, CarDetails.routeName, arguments: car),
                  child: ListItem(
                      brand: car.brand,
                      model: car.model,
                      year: car.year,
                      description: car.description,
                      imageUrl: car.imageUrl)),
              confirmDismiss: (direction) => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text("Delete Car"),
                        content: const Text("Are you sure?"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("No")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  CarRepository().deleteCar(car.id);
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text("Yes")),
                        ],
                      )),
            );
          },
          itemCount: carList.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addCar.routeName);
        },
      ),
    );
  }
}
