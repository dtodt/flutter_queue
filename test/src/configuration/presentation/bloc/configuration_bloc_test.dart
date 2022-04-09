import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_event.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_state.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/add_queue.dart';
import 'package:queue/src/queue/domain/usecases/fetch_queues.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';

import '../../../../constants/queue.dart';
import '../../../../mocks/queue.dart';

void main() {
  late QueueEntity entity;
  late IFetchQueues fetchUsecase;
  late IAddQueue addUsecase;
  late IRemoveQueue removeUsecase;

  setUpAll(() {
    entity = QueueEntityMock();
    fetchUsecase = FetchQueuesMock();
    addUsecase = AddQueueMock();
    removeUsecase = RemoveQueueMock();
  });

  blocTest<ConfigurationBloc, ConfigurationState>(
    'should emit configuration loading, loaded',
    build: () {
      when(() => fetchUsecase.call()).thenAnswer((_) => Stream.value([entity]));
      return ConfigurationBloc(fetchUsecase, addUsecase, removeUsecase);
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<ConfigurationLoadingState>(),
      isA<ConfigurationLoadedState>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'should call add usecase when receive add event',
    build: () {
      when(() => addUsecase.call(entity)).thenAnswer((_) => Future.value());
      return ConfigurationBloc(fetchUsecase, addUsecase, removeUsecase);
    },
    act: (bloc) => bloc.add(AddQueueEvent(entity)),
    verify: (_) {
      verify(() => addUsecase.call(entity)).called(1);
    },
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'should call remove usecase when receive remove event',
    build: () {
      when(() => removeUsecase.call(kIdText)).thenAnswer((_) => Future.value());
      return ConfigurationBloc(fetchUsecase, addUsecase, removeUsecase);
    },
    act: (bloc) => bloc.add(const RemoveQueueEvent(kIdText)),
    verify: (_) {
      verify(() => removeUsecase.call(kIdText)).called(1);
    },
  );
}
