// lib/navigation/app_router.dart
import 'package:ecommerce_app/features/product/presentation/home_screen.dart';
import 'package:ecommerce_app/features/product/presentation/product_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // Gunakan static agar bisa langsung dipanggil tanpa instansiasi kelas
  static final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // Opsional: untuk melihat log navigasi di konsol
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ProductListScreen(),
      ),
    ],
  );
}
