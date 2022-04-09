import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

const kQueueCollection = 'queue';

/// Queue datasource firestore implementation
class QueueFirestoreDatasource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  const QueueFirestoreDatasource(this.firestore);

  @override
  Stream<List<Map<String, dynamic>>> fetchQueues() {
    final ref = firestore.collection(kQueueCollection);
    final snapshots = ref.snapshots();

    return snapshots.map(_convertQuery);
  }

  List<Map<String, dynamic>> _convertQuery(
      QuerySnapshot<Map<String, dynamic>> query) {
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
  Future<void> addQueue(Map<String, dynamic> queue) async {
    final newQueue = {...queue}..remove('id');
    await firestore.collection(kQueueCollection).add(newQueue);
  }

  @override
  Future<void> removeQueue(String id) {
    // TODO: implement removeQueue
    throw UnimplementedError();
  }
}
