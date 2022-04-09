import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';
import 'package:queue/src/queue/infra/repositories/queue_repository.dart';

import '../../../../constants/queue.dart';
import '../../../../mocks/queue.dart';
import '../../../../utils/queue.dart';

void main() {
  late IQueueDatasource datasource;
  late IQueueRepository repository;

  setUpAll(() {
    datasource = QueueDatasourceMock();
    repository = QueueRepository(datasource);
  });

  test('should return a list of queues', () async {
    when(() => datasource.fetchQueues())
        .thenAnswer((_) => Stream.value([kQueueMap]));

    final result = repository.fetchQueues();
    expect(result, emits(isA<List<QueueEntity>>()));
  });

  test('should add a queue', () async {
    when(() => datasource.addQueue(kQueueMap))
        .thenAnswer((_) => Future.value());

    expect(repository.addQueue(getQueueMock()), completes);
  });
}
