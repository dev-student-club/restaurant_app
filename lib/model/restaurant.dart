// Import library Dart yang diperlukan.
import 'dart:convert';

// Kelas Restaurant merepresentasikan data restoran.
class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  // Konstruktor untuk membuat instance Restaurant.
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  // Metode factory untuk membuat instance Restaurant dari Map.
  factory Restaurant.fromMap(Map<String, dynamic> map) => Restaurant(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        pictureId: map["pictureId"],
        city: map["city"],
        rating: map["rating"]?.toDouble() ?? 0.0,
        menus: Menus.fromMap(map["menus"]),
      );

  // Metode untuk mengonversi instance Restaurant menjadi Map.
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toMap(),
      };
}

// Kelas Menus merepresentasikan daftar makanan dan minuman di suatu restoran.
class Menus {
  List<Drink> foods;
  List<Drink> drinks;

  // Konstruktor untuk membuat instance Menus.
  Menus({
    required this.foods,
    required this.drinks,
  });

  // Metode factory untuk membuat instance Menus dari Map.
  factory Menus.fromMap(Map<String, dynamic> map) => Menus(
        foods:
            List<Drink>.from(map["foods"]?.map((x) => Drink.fromMap(x)) ?? []),
        drinks:
            List<Drink>.from(map["drinks"]?.map((x) => Drink.fromMap(x)) ?? []),
      );

  // Metode untuk mengonversi instance Menus menjadi Map.
  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toMap())),
      };
}

// Kelas Drink merepresentasikan makanan atau minuman dalam menu.
class Drink {
  String name;

  // Konstruktor untuk membuat instance Drink.
  Drink({
    required this.name,
  });

  // Metode factory untuk membuat instance Drink dari Map.
  factory Drink.fromMap(Map<String, dynamic> map) => Drink(
        name: map["name"],
      );

  // Metode untuk mengonversi instance Drink menjadi Map.
  Map<String, dynamic> toMap() => {
        "name": name,
      };
}

// Fungsi untuk menguraikan string JSON menjadi daftar restoran.
List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final Map<String, dynamic> parsed = jsonDecode(json);

  if (parsed.containsKey("restaurants")) {
    return List<Restaurant>.from(
      parsed["restaurants"].map((restaurant) => Restaurant.fromMap(restaurant)),
    );
  } else {
    return [];
  }
}
