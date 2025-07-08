enum PromoType { flat, percentage }

class PromoCode {
  final String code;
  final PromoType type;
  final double value; // flat amount or percentage

  PromoCode({
    required this.code,
    required this.type,
    required this.value,
  });

  double apply(double total) {
    if (type == PromoType.flat) {
      return (total - value).clamp(0, total);
    } else {
      return (total - (total * (value / 100))).clamp(0, total);
    }
  }
}
