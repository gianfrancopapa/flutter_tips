import 'package:bloc/bloc.dart';
import 'package:counter_storage/counter_storage.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  static const _counterKey = '_counter';

  late final CounterStorage _counterStorage = CounterStorage();

  void init() async {
    await _counterStorage.init();
    final counter = _counterStorage.getInt(_counterKey);

    emit(counter);
  }

  void increment() {
    final next = state + 1;
    _counterStorage.setInt(_counterKey, next);

    emit(next);
  }
}
