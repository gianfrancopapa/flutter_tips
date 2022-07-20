import 'package:app/counter/counter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}
