import 'package:bloc/bloc.dart';
import 'package:counter_storage/counter_storage.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({
    required CounterStorage counterStorage,
  })  : _counterStorage = counterStorage,
        super(counterStorage.getInt(_counterKey));

  static const _counterKey = '_counter';

  final CounterStorage _counterStorage;

  void increment() {
    final next = state + 1;
    _counterStorage.setInt(_counterKey, next);

    emit(next);
  }
}
