// Import paket dan file yang diperlukan dari kerangka kerja Flutter.
import 'package:flutter/material.dart';
import 'package:restaurant_app/detail/detail_restaurant.dart';
import 'package:restaurant_app/helpers/styles.dart';
import 'package:restaurant_app/home/list_restaurant.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/splash_screen/splash_screen.dart';

// Titik masuk utama aplikasi.
void main() {
  // Jalankan aplikasi dengan membuat instance MyApp dan mengirimkannya ke runApp.
  runApp(const MyApp());
}

// MyApp adalah StatelessWidget yang mewakili akar aplikasi.
class MyApp extends StatelessWidget {
  // Konstruktor untuk MyApp, menggunakan konstruktor const dan parameter kunci opsional.
  const MyApp({super.key});

  // Metode ini membangun struktur keseluruhan aplikasi.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Nonaktifkan banner debug di sudut kanan atas layar.
      debugShowCheckedModeBanner: false,
      // Tetapkan judul aplikasi.
      title: 'Restaurant App',
      // Tentukan tema untuk seluruh aplikasi.
      theme: ThemeData(
        // Tetapkan skema warna untuk aplikasi menggunakan deepPurple sebagai warna dasar.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Aktifkan desain Material 3.
        useMaterial3: true,
        // Terapkan gaya teks kustom yang ditentukan di file styles.dart.
        textTheme: myTextTheme,
      ),
      // Tetapkan rute awal ke SplashScreen saat aplikasi dimulai.
      initialRoute: SplashScreen.routeName,
      // Tentukan rute untuk layar yang berbeda dalam aplikasi.
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        ListRestaurant.routeName: (context) => const ListRestaurant(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(
              // Teruskan restoran yang dipilih sebagai argumen ke layar DetailRestaurant.
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
