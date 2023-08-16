import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mreweather/core/class/crud.dart';
import 'package:mreweather/core/services/get_connection.dart';
import 'package:mreweather/core/services/shared_preference.dart';
import '../../core/constants/keys.dart';
import '../../data/model/weather/weather.dart';
import '../../generated/l10n.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial()) {
    Connectivity().onConnectivityChanged.listen((result) {
      if ((result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) &&
          (state is! WeatherSuccess)) {
        getWeather(null);
      }
    });
  }

  late String q;
  Weather weather = Weather.newEmpty();
  void _getSavedQ() => q = Prefs.shared.getString(AppKeys.qName) ?? '';

  void getWeather(BuildContext? context) async {
    if (AppConnection.connectivityResult == ConnectivityResult.none) {
      return emit(WeatherFailure(S.of(context!).noConnection));
    }
    emit(WeatherIsLoaded());

    try {
      _getSavedQ();
      if (q.trim() == '') return emit(WeatherInitial());

      weather = await CRUD.getWeather(q);

      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
