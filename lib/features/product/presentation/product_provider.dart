import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/product_repository_impl.dart';
import '../data/product_service.dart';
import '../data/product_model.dart';

/// Service provider
final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

/// Repository provider
final productRepositoryProvider = Provider<ProductRepositoryImpl>((ref) {
  final service = ref.watch(productServiceProvider);
  return ProductRepositoryImpl(service);
});

/// Future provider untuk ambil list produk
final productListProvider =
    FutureProvider<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProducts();
});
