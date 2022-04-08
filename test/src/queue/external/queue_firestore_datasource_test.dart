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
    await firestore.collection(kQueueCollection).add(kQueueMap);

    datasource = QueueFirestoreDatasource(firestore);
  });

  test('should return a list of queue map', () async {
    final result = datasource.fetchQueues();
    expect(result, emits(isA<List<Map>>()));
  });
}
