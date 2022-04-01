import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/infra/adapters/json_to_queue.dart';

import '../../../../constants/queue.dart';

void main() {
  test('should convert a map into queue', () async {
    final result = JsonToQueue.fromMap(kQueueMap);
    expect(result, isA<QueueEntity>());
    expect(result.orders, isNotEmpty);
    expect(result.priority, equals(1));
  });

  test('should convert a map into queue when no orders is present', () async {
    final result = JsonToQueue.fromMap(kEmptyQueueMap);
    expect(result, isA<QueueEntity>());
    expect(result.orders, isEmpty);
  });

  test('should convert a list of map into a list of queue', () async {
    final result = JsonToQueue.fromList([kQueueMap]);
    expect(result, isA<List<QueueEntity>>());
  });
}
