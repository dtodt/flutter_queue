import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

/// Get all queues contract
abstract class IGetAllQueues {
  Stream<List<QueueEntity>> call();
}

/// Get all queues implementation
class GetAllQueues implements IGetAllQueues {
  final IQueueRepository repository;

  const GetAllQueues(this.repository);

  @override
  Stream<List<QueueEntity>> call() {
    return repository.getAllQueues();
  }
}
