import 'package:hive/hive.dart';
import 'cart_item_model.dart';

class CartRepository {
  final Box box = Hive.box('cart_box');

  List<CartItemModel> getItems() {
    final items = box.values.toList();
    return items.map((e) => CartItemModel.fromMap(Map.from(e))).toList();
  }

  void addItem(CartItemModel item) {
    final existingIndex = box.values.toList().indexWhere(
      (e) => e['productId'] == item.productId,
    );

    if (existingIndex != -1) {
      final existing = CartItemModel.fromMap(
        Map.from(box.getAt(existingIndex)),
      );

      final updated = existing.copyWith(
        quantity: existing.quantity + item.quantity,
      );

      box.putAt(existingIndex, updated.toMap());
    } else {
      box.add(item.toMap());
    }
  }

  void removeItem(int productId) {
    final index = box.values.toList().indexWhere(
      (e) => e['productId'] == productId,
    );

    if (index != -1) {
      box.deleteAt(index);
    }
  }

  void updateQuantity(int productId, int quantity) {
    final index = box.values.toList().indexWhere(
      (e) => e['productId'] == productId,
    );

    if (index != -1) {
      final existing = CartItemModel.fromMap(
        Map.from(box.getAt(index)),
      );

      final updated = existing.copyWith(quantity: quantity);
      box.putAt(index, updated.toMap());
    }
  }

  void clearCart() {
    box.clear();
  }
}
