import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_event.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_state.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';

import '../../../../mocks/queue.dart';

void main() {
  late ConfigurationBloc bloc;
  late QueueEntity entity;
  late IGetAllQueues usecase;

  setUpAll(() {
    entity = QueueEntityMock();
    usecase = GetAllQueuesMock();
    bloc = ConfigurationBloc(usecase);
  });

  blocTest<ConfigurationBloc, ConfigurationState>(
    'should emit configuration loaded',
    build: () {
      when(() => usecase.call()).thenAnswer((_) => Stream.value([entity]));
      return bloc;
    },
    act: (bloc) => bloc.add(GetAllQueuesEvent()),
    expect: () => [isA<ConfigurationLoaded>()],
  );
}
