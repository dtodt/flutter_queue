import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

class QueueEntityMock extends Mock implements QueueEntity {}

class QueueDatasourceMock extends Mock implements IQueueDatasource {}

class QueueRepositoryMock extends Mock implements IQueueRepository {}
