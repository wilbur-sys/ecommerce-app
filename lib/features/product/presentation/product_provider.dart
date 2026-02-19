import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
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

/// State untuk menyimpan query search
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Provider utama list produk (dynamic berdasarkan query)
final productListProvider =
    FutureProvider<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) {
    return repository.getProducts();
  } else {
    return repository.searchProducts(query);
  }
});



