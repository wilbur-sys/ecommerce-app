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
}
