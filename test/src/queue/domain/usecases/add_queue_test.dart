import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/add_queue.dart';

import '../../../../mocks/queue.dart';

void main() {
  late IQueueRepository repository;
  late AddQueue usecase;

  setUpAll(() {
    repository = QueueRepositoryMock();
    usecase = AddQueue(repository);
  });

  test('should add a queue', () async {
    final entity = QueueEntityMock();
    when(() => repository.addQueue(entity)).thenAnswer((_) => Future.value());

    expect(usecase(entity), completes);
  });
}
