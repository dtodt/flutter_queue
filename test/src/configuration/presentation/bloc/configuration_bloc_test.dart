import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_event.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_state.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/add_queue.dart';
import 'package:queue/src/queue/domain/usecases/fetch_queues.dart';

import '../../../../mocks/queue.dart';

void main() {
  late ConfigurationBloc bloc;
  late QueueEntity entity;
  late IFetchQueues fetchUsecase;
  late IAddQueue addUsecase;

  setUpAll(() {
    entity = QueueEntityMock();
    fetchUsecase = FetchQueuesMock();
    addUsecase = AddQueueMock();
    bloc = ConfigurationBloc(fetchUsecase, addUsecase);
  });

  blocTest<ConfigurationBloc, ConfigurationState>(
    'should emit configuration loading, loaded',
    build: () {
      when(() => fetchUsecase.call()).thenAnswer((_) => Stream.value([entity]));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<ConfigurationLoadingState>(),
      isA<ConfigurationLoadedState>(),
    ],
  );
}
