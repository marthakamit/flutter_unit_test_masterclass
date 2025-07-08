abstract class PriceService {
  Future<double> fetchPrice(String productId);
}

class FakePriceService implements PriceService {
  @override
  Future<double> fetchPrice(String productId) async {
    await Future.delayed(Duration(milliseconds: 100));
    return switch (productId) {
      '1' => 20.0,
      '2' => 45.0,
      '3' => 75.0,
      _ => 0.0,
    };
  }
}