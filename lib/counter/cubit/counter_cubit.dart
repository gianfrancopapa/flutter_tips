import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  static const _counterKey = '_counter';

  late final SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final counter = _sharedPreferences.getInt(_counterKey) ?? 0;

    emit(counter);
  }

  void increment() {
    final next = state + 1;
    _sharedPreferences.setInt(_counterKey, next);

    emit(next);
  }
}
