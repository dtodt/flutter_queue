import 'package:queue/src/queue/domain/entities/queue_entity.dart';

/// Queue repository contract
abstract class IQueueRepository {
  Stream<List<QueueEntity>> getAllQueues();

  Future<void> addQueue(QueueEntity queue);
}
