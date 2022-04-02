import 'package:queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationState {}

class ConfigurationInitial implements ConfigurationState {}

class ConfigurationLoading implements ConfigurationState {}

class ConfigurationLoaded implements ConfigurationState {
  final List<QueueEntity> queues;

  const ConfigurationLoaded(this.queues);
}

class ConfigurationException implements ConfigurationState {
  final String message;

  const ConfigurationException(this.message);
}
