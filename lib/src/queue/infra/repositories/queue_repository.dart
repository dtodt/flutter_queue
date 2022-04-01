import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

/// Queue repository implementation
class QueueRepository implements IQueueRepository {
  final IQueueDatasource datasource;

  const QueueRepository(this.datasource);

  @override
  Stream<List<QueueEntity>> getAllQueues() {
    // TODO: implement getAllQueues
    throw UnimplementedError();
  }
}
