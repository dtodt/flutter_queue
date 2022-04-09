import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/data/models/queue_model.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_event.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_state.dart';

/// Configuration page
class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage>
    with CompleteStateMixin {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>();
    final state = bloc.state;

    // TODO temporary, remove in the future.
    if (state is ConfigurationExceptionState) {
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
                children: <Widget>[
                  const Text('FILAS'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: _addQueueDialog,
                  )
                ],
              ),
            ),
            if (state is ConfigurationLoadedState)
              ListView.builder(
                itemBuilder: (context, index) {
                  final queue = state.queues[index];
                  return ListTile(
                    title: Text('${queue.title} - ${queue.acronym}'),
                    subtitle: Text('${queue.priority} de prioridade'),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                      onPressed: () => _removeQueue(queue.id),
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

  @override
  void completeState() {
    context.read<ConfigurationBloc>().add(FetchQueuesEvent());
  }

  void _addQueueDialog() {
    showDialog(
      context: context,
      builder: (context) {
        var queue = QueueModel.empty();

        return AlertDialog(
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<ConfigurationBloc>().add(AddQueueEvent(queue));
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => queue = queue.copyWith(title: value),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Abreviação',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => queue = queue.copyWith(acronym: value),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Prioridade',
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      queue = queue.copyWith(priority: int.tryParse(value)),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          title: const Text('Nova Fila'),
        );
      },
    );
  }

  void _removeQueue(String id) {
    context.read<ConfigurationBloc>().add(RemoveQueueEvent(id));
  }
}

mixin CompleteStateMixin<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => completeState());
  }
}
