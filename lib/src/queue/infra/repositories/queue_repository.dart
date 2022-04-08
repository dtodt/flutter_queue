import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

/// Queue repository implementation
class QueueRepository implements IQueueRepository {
  final IQueueDatasource datasource;

  const QueueRepository(this.datasource);

  @override
  Stream<List<QueueEntity>> getAllQueues() {
    final stream = datasource.getAllQueues();
    return stream.map(_convert);
  }

  List<QueueEntity> _convert(List<Map> list) {
    return JsonToQueue.fromList(list);
  }

  @override
  Future<void> addQueue(QueueEntity queue) async {
    return await datasource.addQueue(queue);
  }
}
