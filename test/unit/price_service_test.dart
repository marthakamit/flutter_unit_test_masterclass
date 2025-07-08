import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../mocks/mock_price_service.dart';

void main() {
  late MockPriceService mockPriceService;

  setUp(() {
    mockPriceService = MockPriceService();
  });

  test('Mocked price fetch returns custom value', () async {
    when(() => mockPriceService.fetchPrice('1')).thenAnswer((_) async => 99.99);

    final price = await mockPriceService.fetchPrice('1');
    expect(price, 99.99);
    verify(() => mockPriceService.fetchPrice('1')).called(1);
  });

  test('Mocked fetch for unknown returns 0', () async {
    when(() => mockPriceService.fetchPrice(any())).thenAnswer((_) async => 0.0);

    final price = await mockPriceService.fetchPrice('999');

    expect(price, 0.0);
    verify(() => mockPriceService.fetchPrice('999')).called(1);
  });
}
