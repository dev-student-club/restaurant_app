// Import paket Flutter dan kelas-kelas terkait.
import 'package:flutter/material.dart';
import 'package:restaurant_app/detail/detail_restaurant.dart';
import 'package:restaurant_app/model/restaurant.dart';

// Kelas ListRestaurant adalah StatelessWidget yang menangani tampilan daftar restoran.
class ListRestaurant extends StatelessWidget {
  // Tetapkan nama rute untuk ListRestaurant.
  static const routeName = '/listRestaurant';

  // Konstruktor untuk ListRestaurant, menggunakan konstruktor const dan parameter kunci opsional.
  const ListRestaurant({super.key});

  // Metode ini membangun struktur tampilan daftar restoran.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bangun teks judul "Restaurant" dengan ukuran dan bobot teks tertentu.
            _buildText('Restaurant', fontSize: 24, fontWeight: FontWeight.bold),

            // Bangun teks deskripsi "Recomendation Restaurant For You!" dengan ukuran teks tertentu.
            _buildText('Recomendation Restaurant For You!', fontSize: 16),

            // Bangun daftar restoran dengan menggunakan FutureBuilder.
            _buildList(context),
          ],
        ),
      ),
    );
  }

  // Metode ini menggunakan FutureBuilder untuk mengambil dan menampilkan daftar restoran.
  FutureBuilder<List<Restaurant>> _buildList(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: _fetchRestaurants(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Tampilkan indikator loading jika data masih diambil.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Tampilkan pesan error jika terjadi kesalahan.
          return Text('Error: ${snapshot.error}');
        } else {
          // Jika data berhasil diambil, tampilkan daftar restoran menggunakan ListView.builder.
          final List<Restaurant> restaurants = snapshot.data!;
          //TODO 1: membuat list builder
          return Placeholder();
        }
      },
    );
  }

  // Metode ini membangun item restoran dalam daftar.
  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    //TODO 2: layouting list
    return Placeholder();
  }

  // Metode ini membangun widget teks dengan ukuran dan bobot tertentu.
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

  // Metode ini mengambil daftar restoran dari file JSON lokal.
  Future<List<Restaurant>> _fetchRestaurants(BuildContext context) async {
    final String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json');
    return parseRestaurants(jsonString);
  }
}
