import 'package:flutter/material.dart';
import 'package:hack/models/food.dart';

class CanteenProvider with ChangeNotifier {
  String time = 'breakfast';
  String category = 'veg';
  int quantity = 1;
  Map<String, int> cartItems = {};
  List<FoodModel> foodList = [
    FoodModel(
        id: '1',
        name: 'Idili',
        price: 20,
        imageUrl: 'assets/images/bread.png',
        category: 'veg',
        description: 'Lorem epson',
        time: 'breakfast'),
    FoodModel(
      id: '2',
      name: 'Egg Sandwich',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'non-veg',
      description: 'Lorem epson',
      time: 'breakfast',
    ),
    FoodModel(
      id: '3',
      name: 'Bread',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'veg',
      description: 'Lorem epson',
      time: 'breakfast',
    ),
    FoodModel(
      id: '4',
      name: 'Veg Meals',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'veg',
      description: 'Lorem epson',
      time: 'lunch',
    ),
    FoodModel(
      id: '5',
      name: 'Non Veg Meals',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'non-veg',
      description: 'Lorem epson',
      time: 'lunch',
    ),
    FoodModel(
      id: '7',
      name: 'Coffee',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'veg',
      description: 'Lorem epson',
      time: 'tea',
    ),
    FoodModel(
      id: '8',
      name: 'tea',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'veg',
      description: 'Lorem epson',
      time: 'tea',
    ),
    FoodModel(
      id: '9',
      name: 'Sweet Bun',
      price: 20,
      imageUrl: 'assets/images/bread.png',
      category: 'veg',
      description: 'Lorem epson',
      time: 'tea',
    ),
  ];

  List<FoodModel> getFoodList(category, time) {
    return foodList
        .where(
            (element) => element.category == category && element.time == time)
        .toList();
  }

  int getTotalPrice() {
    int total = 0;
    cartItems.forEach((key, value) {
      total +=
          value * foodList.firstWhere((element) => element.name == key).price;
    });
    return total;
  }

  void updateQuantity(String id, int quantity) {
    cartItems[id] = quantity;

    notifyListeners();
  }

  void notifyTime(String t) {
    time = t;
    notifyListeners();
  }
}
