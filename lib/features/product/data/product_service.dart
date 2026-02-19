import '../../../core/network/api_client.dart';
import 'product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await apiClient.get('/products');
      final List data = response.data['products'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Gagal mengambil produk dari Service: $e");
    }
  }

  Future<ProductModel> fetchProductDetail(int id) async {
    try {
      final response = await apiClient.get('/products/$id');
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Gagal mengambil detail produk: $e");
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
  try {
    final response =
        await apiClient.get('/products/search?q=$query');
    final List data = response.data['products'];
    return data.map((json) => ProductModel.fromJson(json)).toList();
  } catch (e) {
    throw Exception("Gagal search produk: $e");
  }
  }
}
