class CartItem {
  final String id;
  final String name;
  double price; // allow dynamic price update
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CartItem && id == other.id);

  @override
  int get hashCode => id.hashCode;
}
