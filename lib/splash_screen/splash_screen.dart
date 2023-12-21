// Import paket yang diperlukan dari kerangka kerja Flutter.
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/home/list_restaurant.dart';

// SplashScreen adalah StatefulWidget yang menangani tampilan layar awal aplikasi.
class SplashScreen extends StatefulWidget {
  // Tentukan nama rute untuk SplashScreen.
  static const routeName = '/splash';

  // Konstruktor untuk SplashScreen, menggunakan konstruktor const dan parameter kunci opsional.
  const SplashScreen({super.key});

  // Metode ini membuat dan mengembalikan instance dari _SplashScreenState.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// _SplashScreenState adalah State dari SplashScreen yang mengatur tampilan layar awal.
class _SplashScreenState extends State<SplashScreen> {
  // Metode ini membangun tampilan layar awal dengan FlutterSplashScreen.
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      // Tentukan warna latar belakang SplashScreen.
      backgroundColor: Colors.white,
      // Tentukan widget anak SplashScreen berupa gambar restoran.
      childWidget: SizedBox(
        height: 200,
        child: Image.asset("images/restaurant-icon.png"),
      ),
      // Tentukan durasi tampilan SplashScreen.
      duration: const Duration(milliseconds: 1500),
      // Tentukan durasi animasi SplashScreen.
      animationDuration: const Duration(milliseconds: 1000),
      // Callback yang dipanggil setelah animasi SplashScreen selesai.
      onAnimationEnd: () {
        // Pindah ke layar ListRestaurant setelah SplashScreen selesai.
        Navigator.pushReplacementNamed(context, ListRestaurant.routeName);
      },
    );
  }
}
