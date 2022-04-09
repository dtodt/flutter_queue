import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';

import '../../../../constants/queue.dart';
import '../../../../mocks/queue.dart';

void main() {
  late IQueueRepository repository;
  late IRemoveQueue usecase;

  setUpAll(() {
    repository = QueueRepositoryMock();
    usecase = RemoveQueue(repository);
  });

  test('should remove a queue', () async {
    when(() => repository.removeQueue(kIdText))
        .thenAnswer((_) => Future.value());

    expect(usecase(kIdText), completes);
  });
}
