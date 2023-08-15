import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mreweather/core/services/shared_preference.dart';
import '../../core/constants/keys.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  late String q;
  void _getSavedQ() => q = Prefs.shared.getString(AppKeys.qName) ?? '';

  void getWeather() {
    emit(WeatherIsLoaded());
    _getSavedQ();
    if (q.trim() == '') {
      emit(WeatherInitial());
      return;
    }
    emit(WeatherSuccess());
  }
}
