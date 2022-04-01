/// Queue datasource contract
abstract class IQueueDatasource {
  Stream<List<Map>> getAllQueues();
}
