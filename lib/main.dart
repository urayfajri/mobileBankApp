import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/login.page.dart';

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
        title: 'Mandiri Living App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          duration: 2000,
          animationDuration: const Duration(seconds: 1),
          splash: Image.network(
            'https://ik.imagekit.io/fdu5ptj23co/f132e326-9f22-4136-83f3-1712e0a223d4_DYZ8c2Are.png',
          ),
          splashIconSize: 300,
          nextScreen: const LoginPage(),
          splashTransition: SplashTransition.sizeTransition,
        ));
  }
}
