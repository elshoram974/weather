import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mreweather/data/model/weather/include/forecast/include/include/hour_element.dart';

import '../../core/class/crud.dart';
import '../../core/constants/keys.dart';
import '../../core/services/get_connection.dart';
import '../../core/services/localize.dart';
import '../../core/services/shared_preference.dart';
import '../../data/model/weather/weather.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial()) {
    Connectivity().onConnectivityChanged.listen((result) {
      if ((result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) &&
          (state is! WeatherSuccess)) {
        getWeather();
      }
    });
  }

  late String q;
  MaterialColor? primarySwatch;
  late HourElement hour;

  Weather weather = Weather.newEmpty();
  void _getSavedQ() => q = Prefs.shared.getString(AppKeys.qName) ?? '';

  void getWeather() async {
    if (AppConnection.connectivityResult == ConnectivityResult.none) {
      return emit(WeatherFailure(MyLocale.s.noConnection));
    }
    emit(WeatherIsLoaded());

    try {
      _getSavedQ();
      if (q.trim() == '') return emit(WeatherInitial());

      weather = await CRUD.getWeather(q);
      hour = _getHours()!;
      print(hour.condition.text);
      _getPrimarySwatch(hour.condition.color);
      print(primarySwatch);

      emit(WeatherSuccess());
    } catch (e) {
      _getPrimarySwatch(null);

      emit(WeatherFailure(e.toString()));
    }
  }

  void _getPrimarySwatch(MaterialColor? color) => primarySwatch = color;
  HourElement? _getHours() {
    for (HourElement h in weather.forecast.forecastDays[0].hours) {
      if (DateTime.parse(h.time).hour ==
          DateTime.parse(weather.current.lastUpdated).hour) return h;
    }
    return null;
  }
}
