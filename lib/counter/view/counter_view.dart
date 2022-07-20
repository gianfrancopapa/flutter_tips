import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/counter/cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit()..init(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter tips - Modularization')),
      body: const Center(
        child: _CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.select((CounterCubit cubit) => cubit.state);
    return Text(
      counter.toString(),
      style: const TextStyle(
        fontSize: 32,
      ),
    );
  }
}
