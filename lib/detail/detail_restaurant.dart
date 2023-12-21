import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';

class DetailRestaurant extends StatefulWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const DetailRestaurant({super.key, required this.restaurant});

  @override
  // ignore: library_private_types_in_public_api
  _DetailRestaurantState createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.restaurant.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: widget.restaurant.pictureId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildInfo(Icons.place, widget.restaurant.city, 20, 25),
            _buildSection(
                'Deskripsi',
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.restaurant.description,
                    textAlign: TextAlign.justify,
                  ),
                )),
            _buildInfo(Icons.star, widget.restaurant.rating.toString(), 16, 12),
            _buildSection('Foods',
                _buildItemsListFood(widget.restaurant, Colors.lightGreen)),
            const SizedBox(height: 24),
            _buildSection('Drink',
                _buildItemsListDrink(widget.restaurant, Colors.lightBlue)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      children: [
        _buildTitle(title),
        content,
      ],
    );
  }

  Widget _buildItemsListFood(Restaurant restaurant, Color color) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurant.menus.foods.length,
        itemBuilder: (context, index) {
          return _buildFoodItem(restaurant.menus.foods[index], color);
        },
      ),
    );
  }

  Widget _buildItemsListDrink(Restaurant restaurant, Color color) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurant.menus.drinks.length,
        itemBuilder: (context, index) {
          return _buildFoodItem(restaurant.menus.drinks[index], color);
        },
      ),
    );
  }

  Widget _buildFoodItem(Drink food, Color color) {
    return Container(
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            food.name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Padding _buildTitle(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$name:',
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Padding _buildInfo(IconData icons, name, double iconSize, double textSize) {
    return Padding(
      padding: EdgeInsets.all(iconSize),
      child: Row(
        children: [
          Icon(
            icons,
            size: iconSize,
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
