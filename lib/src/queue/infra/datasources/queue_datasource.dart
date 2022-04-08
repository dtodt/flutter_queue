import 'package:queue/src/queue/domain/entities/queue_entity.dart';

/// Queue datasource contract
abstract class IQueueDatasource {
  Stream<List<Map>> fetchQueues();

  Future<void> addQueue(QueueEntity queue);
}
