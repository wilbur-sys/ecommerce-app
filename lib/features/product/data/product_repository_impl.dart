import '../domain/product_repository.dart';
import 'product_model.dart';
import 'product_service.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService service;

  ProductRepositoryImpl(this.service);

  @override
  Future<List<ProductModel>> getProducts() async {
    // Di sini bisa tambahkan logika Cache/Lokal
    return await service.fetchProducts();
  }
}
