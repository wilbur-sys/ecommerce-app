import 'package:ecommerce_app/features/product/data/product_repository_impl.dart';
import 'package:ecommerce_app/features/product/data/product_service.dart';
import 'package:flutter/material.dart';
import '../data/product_remote_data_source.dart'; // Import data source yang dibuat sebelumnya

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test API DummyJSON")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            print("--- Testing Day 3 Flow ---");

            // Inisialisasi pipeline
            final service = ProductService();
            final repository = ProductRepositoryImpl(service);

            try {
              final products = await repository.getProducts();
              print("Berhasil! Total: ${products.length} item.");
              print("Sample Deskripsi: ${products[0].description}");
              print("Sample Rating: ${products[0].rating}");
            } catch (e) {
              print("Error di Day 3: $e");
            }
          },
          child: const Text("Fetch Data (Cek Console)"),
        ),
      ),
    );
  }
}
