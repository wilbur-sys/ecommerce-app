import '../../../core/network/api_client.dart';
import 'product_model.dart';

class ProductRemoteDataSource {
  // Gunakan nama fungsi fetchProducts sesuai yang dipanggil di HomeScreen
  Future<void> fetchProducts() async {
    try {
      print("Mengambil data dari endpoint /products...");
      final response = await apiClient.dio.get('/products');
      
      // Ambil list produk dari response
      final List productsJson = response.data['products'];
      
      // Konversi ke model (untuk memastikan model kita sudah benar)
      final products = productsJson.map((json) => ProductModel.fromJson(json)).toList();

      print("Berhasil! Terambil ${products.length} produk.");
      print("Produk pertama: ${products[0].title} seharga \$${products[0].price}");
      
    } catch (e) {
      print("Gagal fetch data: $e");
    }
  }
}
