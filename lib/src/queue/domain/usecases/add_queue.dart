import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

/// Add queue contract
abstract class IAddQueue {
  Future<void> call(QueueEntity queue);
}

/// Add queue implementation
class AddQueue implements IAddQueue {
  final IQueueRepository repository;

  const AddQueue(this.repository);

  @override
  Future<void> call(QueueEntity queue) async {
    return await repository.addQueue(queue);
  }
}
