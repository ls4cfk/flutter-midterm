import 'package:midterm/data/models/cars_model.dart';
import '../dummy_data.dart';

class CarRepository {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }

  void deleteCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}
