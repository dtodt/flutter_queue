import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';
import 'package:queue/src/queue/infra/adapters/json_to_order.dart';

import '../../../../constants/queue.dart';

void main() {
  test('should convert a map into order', () async {
    final result = JsonToOrder.fromMap(kOrderMap);
    expect(result, isA<Order>());
    expect(result.status, equals(OrderStatus.waiting));
  });

  test('should convert a list of map into a list of order', () async {
    final result = JsonToOrder.fromList([kOrderMap]);
    expect(result, isA<List<Order>>());
    expect(result[0].status, equals(OrderStatus.waiting));
  });
}
