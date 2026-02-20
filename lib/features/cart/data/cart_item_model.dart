class CartItemModel {
  final int productId;
  final String title;
  final double price;
  final String thumbnail;
  final int quantity;

  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.quantity,
  });

  CartItemModel copyWith({
    int? quantity,
  }) {
    return CartItemModel(
      productId: productId,
      title: title,
      price: price,
      thumbnail: thumbnail,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'thumbnail': thumbnail,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromMap(Map map) {
    return CartItemModel(
      productId: map['productId'],
      title: map['title'],
      price: map['price'],
      thumbnail: map['thumbnail'],
      quantity: map['quantity'],
    );
  }
}
