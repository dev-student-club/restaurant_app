import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) => Restaurant(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        pictureId: map["pictureId"],
        city: map["city"],
        rating: map["rating"]?.toDouble() ?? 0.0,
        menus: Menus.fromMap(map["menus"]),
      );

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

class Menus {
  List<Drink> foods;
  List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromMap(Map<String, dynamic> map) => Menus(
        foods:
            List<Drink>.from(map["foods"]?.map((x) => Drink.fromMap(x)) ?? []),
        drinks:
            List<Drink>.from(map["drinks"]?.map((x) => Drink.fromMap(x)) ?? []),
      );

  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toMap())),
      };
}

class Drink {
  String name;

  Drink({
    required this.name,
  });

  factory Drink.fromMap(Map<String, dynamic> map) => Drink(
        name: map["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}

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
