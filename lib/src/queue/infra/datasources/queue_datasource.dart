/// Queue datasource contract
abstract class IQueueDatasource {
  Stream<List<Map<String, dynamic>>> fetchQueues();

  Future<void> addQueue(Map<String, dynamic> queue);
}
