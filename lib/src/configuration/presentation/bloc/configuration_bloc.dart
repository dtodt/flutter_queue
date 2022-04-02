import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';

import 'configuration_event.dart';
import 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllQueuesUsecase;

  ConfigurationBloc(this.getAllQueuesUsecase) : super(ConfigurationInitial()) {
    on<GetAllQueuesEvent>(
      _getAllQueues,
      transformer: restartable(),
    );
  }

  FutureOr<void> _getAllQueues(
      GetAllQueuesEvent event, Emitter<ConfigurationState> emit) async {
    await emit.forEach(
      getAllQueuesUsecase(),
      onData: (List<QueueEntity> data) => ConfigurationLoaded(data),
    );
  }
}
