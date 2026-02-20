import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../data/cart_item_model.dart';
import '../data/cart_repository.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItemModel>>((
  ref,
) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItemModel>> {
  final CartRepository _repository = CartRepository();

  CartNotifier() : super([]) {
    loadCart();
  }

  void loadCart() {
    state = _repository.getItems();
  }

  void addItem(CartItemModel item) {
    _repository.addItem(item);
    loadCart();

    print("Cart items:");
    for (var item in state) {
      print("${item.title} - qty: ${item.quantity}");
    }
  }

  void removeItem(int productId) {
    _repository.removeItem(productId);
    loadCart();
  }

  void updateQuantity(int productId, int quantity) {
    _repository.updateQuantity(productId, quantity);
    loadCart();
  }
  
}
