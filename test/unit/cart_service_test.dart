import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_masterclass/models/cart_item.dart';
import 'package:flutter_unit_test_masterclass/models/promo_code.dart';
import 'package:flutter_unit_test_masterclass/services/cart_service.dart';

void main() {
  late CartService cart;

  setUp(() {
    cart = CartService();
  });

  test('Add item to cart', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    expect(cart.items.length, 1);
    expect(cart.getSubtotal(), 100);
  });

  test('Add same item twice increases quantity', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    expect(cart.items.first.quantity, 2);
  });

  test('Remove item from cart', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    cart.removeItem('1');
    expect(cart.items.isEmpty, true);
  });

  test('Update quantity in cart', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    cart.updateQuantity('1', 5);
    expect(cart.items.first.quantity, 5);
  });

  test('Get total with no promo returns subtotal', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    cart.addItem(CartItem(id: '2', name: 'Cap', price: 50));
    expect(cart.getTotal(), 150);
  });

  test('Apply flat promo code', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    final promo = PromoCode(code: 'FLAT50', type: PromoType.flat, value: 50);
    cart.applyPromo(promo);
    expect(cart.getTotal(), 50);
  });

  test('Apply percentage promo code', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    final promo = PromoCode(code: 'SAVE10', type: PromoType.percentage, value: 10);
    cart.applyPromo(promo);
    expect(cart.getTotal(), 90);
  });

  test('Clear promo resets total to full', () {
    cart.addItem(CartItem(id: '1', name: 'Shoes', price: 100));
    final promo = PromoCode(code: 'SAVE10', type: PromoType.percentage, value: 10);
    cart.applyPromo(promo);
    cart.clearPromo();
    expect(cart.getTotal(), 100);
  });
}
