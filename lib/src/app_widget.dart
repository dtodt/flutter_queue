import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue/src/configuration/configuration_module.dart';
import 'package:queue/src/configuration/presentation/pages/configuration_page.dart';
import 'package:queue/src/queue/queue_module.dart';

/// Main widget
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ConfigurationPage(),
        title: 'Flutter Queue',
        theme: ThemeData.dark(),
      ),
      providers: [
        ...queueModule,
        ...configurationModule,
      ],
    );
  }
}
