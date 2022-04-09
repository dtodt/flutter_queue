import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:queue/src/queue/infra/datasources/queue_datasource.dart';

import '../../../constants/queue.dart';

void main() {
  late FirebaseFirestore firestore;
  late IQueueDatasource datasource;

  setUpAll(() async {
    firestore = FakeFirebaseFirestore();
    datasource = QueueFirestoreDatasource(firestore);
  });

  tearDown(() async {
    final data = await firestore.collection(kQueueCollection).get();
    for (var doc in data.docs) {
      await doc.reference.delete();
    }
  });

  test('should return a list of queue map', () async {
    await firestore.collection(kQueueCollection).add(kEmptyQueueMap);

    final result = datasource.fetchQueues();
    expect(result, emits(isA<List<Map>>()));
  });

  test('should return a list of queue map', () async {
    expect(datasource.addQueue(kEmptyQueueMap), completes);
    final ref = await firestore.collection(kQueueCollection).get();
    final queues = ref.docs;
    expect(queues.length, 1);
    expect(queues.first.data()['title'], equals(kEmptyQueueMap['title']));
    expect(queues.first.data()['id'], isNot(equals(kEmptyQueueMap['id'])));
  });
}
