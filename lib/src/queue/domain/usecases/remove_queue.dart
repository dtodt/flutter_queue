import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

/// Remove queue contract
abstract class IRemoveQueue {
  Future<void> call(String id);
}

/// Remove queue implementation
class RemoveQueue implements IRemoveQueue {
  final IQueueRepository repository;

  const RemoveQueue(this.repository);

  @override
  Future<void> call(String id) async {
    await repository.removeQueue(id);
  }
}
