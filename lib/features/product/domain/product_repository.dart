import '../data/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductDetail(int id);
  Future<List<ProductModel>> searchProducts(String query);
}
