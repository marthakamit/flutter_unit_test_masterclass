import 'package:collection/collection.dart';
import '../models/promo_code.dart';

class PromoService {
  final List<PromoCode> _validPromos = [
    PromoCode(code: 'SAVE10', type: PromoType.percentage, value: 10),
    PromoCode(code: 'FLAT50', type: PromoType.flat, value: 50),
  ];

  PromoCode? validate(String code) {
    return _validPromos.firstWhereOrNull(
          (promo) => promo.code.toLowerCase() == code.toLowerCase(),
    );
  }
}
