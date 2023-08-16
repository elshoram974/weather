import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mreweather/controller/weather_cubit/weather_cubit.dart';

import '../../core/class/crud.dart';
import '../../core/constants/keys.dart';
import '../../core/services/shared_preference.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BuildContext context;
  SearchCubit(this.context) : super(SearchInitial()) {
    // Connectivity().onConnectivityChanged.listen((result) {
    //   if ((result == ConnectivityResult.wifi ||
    //           result == ConnectivityResult.mobile) &&
    //       state is SearchFailure) {
    //     getWeather(null);
    //   }
    // });
    getSavedQ();
    initControllers();
  }

  late TextEditingController controller;
  late String q;

  void initControllers() => controller = TextEditingController(text: q);

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  void getSavedQ() => q = Prefs.shared.getString(AppKeys.qName) ?? '';

  Future<List<String>> suggestionsCallback(pattern) async {
    List<String> suggestions = [];
    emit(SearchIsLoaded());

    try {
      suggestions.addAll(await CRUD.getQ(pattern));
      emit(SearchSuccess());
    } catch (e) {
      suggestions.clear();
      emit(SearchFailure());
    }
    return suggestions;
  }

  void onSuggestionSelected(String suggestions) async {
    controller.text = suggestions;
    q = suggestions;
    Prefs.shared.setString(AppKeys.qName, suggestions);
    emit(SearchSuccess());

    BlocProvider.of<WeatherCubit>(context).getWeather(context);

    Navigator.pop(context);
  }
}
