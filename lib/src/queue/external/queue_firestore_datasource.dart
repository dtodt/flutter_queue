import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

const kQueueCollection = 'queue';

/// Queue datasource firestore implementation
class QueueFirestoreDatasource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  const QueueFirestoreDatasource(this.firestore);

  @override
  Stream<List<Map>> getAllQueues() {
    final ref = firestore.collection(kQueueCollection);
    final snapshots = ref.snapshots();

    return snapshots.map(_convertQuery);
  }

  List<Map> _convertQuery(QuerySnapshot<Map<String, dynamic>> query) {
    return query.docs.map(_extractDoc).toList();
  }

  Map<String, dynamic> _extractDoc(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return {
      'id': doc.id,
      ...doc.data(),
    };
  }

  @override
  Future<void> addQueue(QueueEntity queue) {
    // TODO: implement addQueue
    throw UnimplementedError();
  }
}
