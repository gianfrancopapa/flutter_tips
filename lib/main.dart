import 'package:app/counter/counter.dart';
import 'package:counter_storage/counter_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final counterStorage = CounterStorage();
  await counterStorage.init();

  runApp(
    App(
      counterStorage: counterStorage,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    required CounterStorage counterStorage,
    Key? key,
  })  : _counterStorage = counterStorage,
        super(key: key);

  final CounterStorage _counterStorage;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _counterStorage,
      child: MaterialApp(
        title: 'Flutter Tips',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterPage(),
      ),
    );
  }
}
