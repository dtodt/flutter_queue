import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/add_queue.dart';
import 'package:queue/src/queue/domain/usecases/fetch_queues.dart';
import 'package:queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';
import 'package:queue/src/queue/infra/repositories/queue_repository.dart';

/// Queue dependency injection
final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: (context) => QueueFirestoreDatasource(context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(context.read())),

  ///? Use cases
  Provider<IFetchQueues>(create: (context) => FetchQueues(context.read())),
  Provider<IAddQueue>(create: (context) => AddQueue(context.read())),
];
