import '../models/cart_item.dart';
import '../models/promo_code.dart';

class CartService {
  final List<CartItem> _items = [];
  PromoCode? _appliedPromo;

  List<CartItem> get items => List.unmodifiable(_items);
  PromoCode? get promo => _appliedPromo;

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index == -1) {
      _items.add(item);
    } else {
      _items[index].quantity += item.quantity;
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  void updateQuantity(String id, int quantity) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1 && quantity > 0) {
      _items[index].quantity = quantity;
    } else if (index != -1 && quantity <= 0) {
      removeItem(id);
    }
  }

  double getSubtotal() {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double getTotal() {
    double subtotal = getSubtotal();
    return _appliedPromo?.apply(subtotal) ?? subtotal;
  }

  void applyPromo(PromoCode promo) {
    _appliedPromo = promo;
  }

  void clearPromo() {
    _appliedPromo = null;
  }

  void clearCart() {
    _items.clear();
    _appliedPromo = null;
  }
}
