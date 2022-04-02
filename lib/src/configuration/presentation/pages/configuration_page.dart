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
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: Row(
                children: const <Widget>[
                  Text('FILAS'),
                  Spacer(),
                  Icon(Icons.add_circle_outline)
                ],
              ),
            ),
            if (state is ConfigurationLoaded)
              ListView.builder(
                itemBuilder: (context, index) {
                  final queue = state.queues[index];
                  return ListTile(
                    title: Text('${queue.title} - ${queue.acronym}'),
                    subtitle: Text('${queue.priority} de prioridade'),
                    trailing: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                  );
                },
                itemCount: state.queues.length,
                shrinkWrap: true,
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: Text('CONTROLE'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: ElevatedButton(
                child: const Text('Reiniciar Filas'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
