import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/fetch_queues.dart';

import 'configuration_event.dart';
import 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IFetchQueues fetchQueuesUsecase;

  ConfigurationBloc(this.fetchQueuesUsecase)
      : super(ConfigurationInitialState()) {
    on<FetchQueuesEvent>(
      _fetchQueues,
      transformer: restartable(),
    );
  }

  FutureOr<void> _fetchQueues(
      FetchQueuesEvent event, Emitter<ConfigurationState> emit) async {
    emit(ConfigurationLoadingState());

    await emit.onEach<List<QueueEntity>>(
      fetchQueuesUsecase(),
      onData: (data) => emit(ConfigurationLoadedState(data)),
      onError: (_, stack) =>
          emit(ConfigurationExceptionState(stack.toString())),
    );
  }
}
