import 'package:flutter/material.dart';
import 'package:restaurant_app/detail/detail_restaurant.dart';
import 'package:restaurant_app/helpers/styles.dart';
import 'package:restaurant_app/home/list_restaurant.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: myTextTheme,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        ListRestaurant.routeName: (context) => const ListRestaurant(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
