// lib/main.dart
import 'package:flutter/material.dart';
import 'navigation/app_router.dart'; // Impor file router Anda

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router, // Panggil objek router dari file terpisah
    );
  }
}
