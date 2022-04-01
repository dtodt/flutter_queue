import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

void main() {
  late IQueueRepository repository;
  late GetAllQueues usecase;

  setUpAll(() {
    repository = QueueRepositoryMock();
    usecase = GetAllQueues(repository);
  });

  test('should return a list of queues', () async {
    final entity = QueueEntityMock();
    when(() => repository.getAllQueues())
        .thenAnswer((_) => Stream.value([entity]));

    final result = usecase();
    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
