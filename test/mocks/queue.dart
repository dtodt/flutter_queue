import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/add_queue.dart';
import 'package:queue/src/queue/domain/usecases/fetch_queues.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

class QueueEntityMock extends Mock implements QueueEntity {}

class QueueDatasourceMock extends Mock implements IQueueDatasource {}

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class FetchQueuesMock extends Mock implements IFetchQueues {}

class AddQueueMock extends Mock implements IAddQueue {}
