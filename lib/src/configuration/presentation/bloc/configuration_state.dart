import 'package:queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationState {}

class ConfigurationInitialState implements ConfigurationState {}

class ConfigurationLoadingState implements ConfigurationState {}

class ConfigurationLoadedState implements ConfigurationState {
  final List<QueueEntity> queues;

  const ConfigurationLoadedState(this.queues);
}

class ConfigurationExceptionState implements ConfigurationState {
  final String message;

  const ConfigurationExceptionState(this.message);
}
