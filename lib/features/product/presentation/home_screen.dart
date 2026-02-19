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
          // Di dalam HomeScreen
          onPressed: () async {
            print("Tombol ditekan, memulai fetch...");
            await ProductRemoteDataSource().fetchProducts();
            print("Proses fetch selesai.");
          },
          child: const Text("Fetch Data (Cek Console)"),
        ),
      ),
    );
  }
}
