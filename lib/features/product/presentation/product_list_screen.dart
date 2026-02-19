import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_provider.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productListProvider);
    final query = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search product...",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),

          Expanded(
            child: productAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (error, stack) => Center(child: Text("Error:\n$error")),

              data: (products) {
                if (products.isEmpty) {
                  return const Center(child: Text("No products found"));
                }

                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ListTile(
                      leading: Image.network(
                        product.thumbnail,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                      onTap: () {
                        context.go('/detail/${product.id}');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
