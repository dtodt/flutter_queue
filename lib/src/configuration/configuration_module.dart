import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/presentation/bloc/configuration_bloc.dart';

/// Configuration dependency injection
final configurationModule = [
  BlocProvider(
    create: (context) => ConfigurationBloc(
      context.read(),
      context.read(),
      context.read(),
    ),
  ),
];
