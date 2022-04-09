import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/add_queue.dart';
import 'package:queue/src/queue/domain/usecases/fetch_queues.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';

import 'configuration_event.dart';
import 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IFetchQueues fetchQueuesUsecase;
  final IAddQueue addQueueUsecase;
  final IRemoveQueue removeQueueUsecase;

  ConfigurationBloc(
    this.fetchQueuesUsecase,
    this.addQueueUsecase,
    this.removeQueueUsecase,
  ) : super(ConfigurationInitialState()) {
    on<FetchQueuesEvent>(_fetchQueues, transformer: restartable());
    on<AddQueueEvent>(_addQueue, transformer: sequential());
    on<RemoveQueueEvent>(_removeQueue, transformer: sequential());
  }

  Future<void> _fetchQueues(
      FetchQueuesEvent event, Emitter<ConfigurationState> emit) async {
    emit(ConfigurationLoadingState());

    await emit.onEach<List<QueueEntity>>(
      fetchQueuesUsecase(),
      onData: (data) => emit(ConfigurationLoadedState(data)),
      onError: (_, stack) =>
          emit(ConfigurationExceptionState(stack.toString())),
    );
  }

  Future<void> _addQueue(AddQueueEvent event, _) async {
    await addQueueUsecase(event.queue);
  }

  Future<void> _removeQueue(RemoveQueueEvent event, _) async {
    await removeQueueUsecase(event.id);
  }
}
