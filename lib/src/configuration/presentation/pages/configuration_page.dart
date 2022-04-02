import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_event.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_state.dart';

/// Configuration page
class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>()..add(GetAllQueuesEvent());
    final state = bloc.state;

    // TODO temporary, remove in the future.
    if (state is ConfigurationException) {
      print(state.message);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Column(
        children: <Widget>[
          const Text('FILAS'),
          if (state is ConfigurationLoaded)
            ListView.builder(
              itemBuilder: (context, index) {
                final queue = state.queues[index];
                return ListTile(
                  title: Text('${queue.title} - ${queue.acronym}'),
                  subtitle: Text('${queue.priority} de prioridade'),
                );
              },
              itemCount: state.queues.length,
              shrinkWrap: true,
            ),
        ],
      ),
    );
  }
}
