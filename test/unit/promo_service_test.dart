import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_masterclass/services/promo_service.dart';

void main() {
  final service = PromoService();

  test('Validate valid promo code returns promo', () {
    final promo = service.validate('SAVE10');
    expect(promo, isNotNull);
    expect(promo!.value, 10);
  });

  test('Invalid promo code returns null', () {
    final promo = service.validate('INVALID');
    expect(promo, isNull);
  });

  test('Promo code match is case-insensitive', () {
    final promo = service.validate('flat50');
    expect(promo, isNotNull);
    expect(promo!.code, 'FLAT50');
  });
}
