import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/product_model.dart';
import 'product_provider.dart';

final productDetailProvider = FutureProvider.family<ProductModel, int>((
  ref,
  productId,
) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProductDetail(productId);
});
