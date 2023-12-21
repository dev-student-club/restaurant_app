import 'package:flutter/material.dart';
import 'package:restaurant_app/detail/detail_restaurant.dart';
import 'package:restaurant_app/model/restaurant.dart';

class ListRestaurant extends StatelessWidget {
  static const routeName = '/listRestaurant';
  const ListRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText('Restaurant', fontSize: 24, fontWeight: FontWeight.bold),
            _buildText('Recomendation Restaurant For You!', fontSize: 16),
            _buildList(context),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<Restaurant>> _buildList(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: _fetchRestaurants(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Restaurant> restaurants = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _buildRestaurantItem(context, restaurants[index]);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: ListTile(
        leading: buildHeroImage(restaurant),
        title: Text(
          restaurant.name,
          style: const TextStyle(fontWeight: FontWeight.w200),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconName(restaurant.city, Icons.place),
            _buildIconName('${restaurant.rating}', Icons.star),
          ],
        ),
        onTap: () {
          // Navigate to the detail page when tapped
          Navigator.pushNamed(context, DetailRestaurant.routeName,
              arguments: restaurant);
        },
      ),
    );
  }

  Row _buildIconName(String name, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 12,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(name),
      ],
    );
  }

  Hero buildHeroImage(Restaurant restaurant) {
    return Hero(
        tag: restaurant.pictureId,
        child: SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _buildImage(restaurant.pictureId),
          ),
        ));
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
    );
  }

  Widget _buildText(String text,
      {double fontSize = 16, FontWeight fontWeight = FontWeight.normal}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 12, right: 24),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  Future<List<Restaurant>> _fetchRestaurants(BuildContext context) async {
    final String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json');
    return parseRestaurants(jsonString);
  }
}
