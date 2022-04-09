import 'package:queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationEvent {}

class FetchQueuesEvent implements ConfigurationEvent {}

class AddQueueEvent implements ConfigurationEvent {
  final QueueEntity queue;

  const AddQueueEvent(this.queue);
}

class RemoveQueueEvent implements ConfigurationEvent {
  final String id;

  const RemoveQueueEvent(this.id);
}
