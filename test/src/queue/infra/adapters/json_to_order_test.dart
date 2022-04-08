import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';
import 'package:queue/src/queue/infra/adapters/json_to_order.dart';

import '../../../../constants/queue.dart';
import '../../../../utils/queue.dart';

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

  test('should convert an order into map', () async {
    final result = JsonToOrder.toMap(getOrderMock());
    expect(result, isA<Map>());
    expect(result['status'], equals('waiting'));
    expect(result['timestamp'], equals(kTimestampText));
  });

  test('should convert a list of order into a list of map', () async {
    final result = JsonToOrder.toList([getOrderMock()]);
    expect(result, isA<List<Map>>());
    expect(result[0]['status'], equals('waiting'));
    expect(result[0]['timestamp'], equals(kTimestampText));
  });
}
