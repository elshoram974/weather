import 'package:flutter/material.dart';

import '../../controller/weather_cubit/weather_state.dart';
import 'error_widget.dart';

class NotSuccessWidget extends StatelessWidget {
  const NotSuccessWidget(this.state, {super.key});
  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state is WeatherIsLoaded,
      replacement: MyErrorWidget(
          (state is WeatherFailure) ? (state as WeatherFailure).message : ''),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
