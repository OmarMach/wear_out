import 'product.dart';

class CartItem {
  final Product product;
  final int quantity;
  final String size;

  CartItem({
    required this.product,
    required this.quantity,
    required this.size,
  });

  CartItem copyWith({
    Product? product,
    int? quantity,
    String? size,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }

  @override
  String toString() => 'CartItem(product: $product, quantity: $quantity, size: $size)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem && other.product == product && other.quantity == quantity && other.size == size;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}

class Cart {
  final List<CartItem> cartItems = [];

  int calculateCartTotalPrice() {
    int totalPrice = 0;

    for (var cartItem in cartItems) {
      totalPrice = cartItem.product.price * cartItem.quantity;
    }

    return totalPrice;
  }
}
