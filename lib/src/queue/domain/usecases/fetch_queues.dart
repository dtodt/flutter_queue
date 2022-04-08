import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

/// Fetch queues contract
abstract class IFetchQueues {
  Stream<List<QueueEntity>> call();
}

/// Fetch queues implementation
class FetchQueues implements IFetchQueues {
  final IQueueRepository repository;

  const FetchQueues(this.repository);

  @override
  Stream<List<QueueEntity>> call() {
    return repository.getAllQueues();
  }
}
