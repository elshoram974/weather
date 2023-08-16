import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/weather_cubit/weather_cubit.dart';
import '../../controller/weather_cubit/weather_state.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/not_success_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
    cubit.getWeather(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Visibility(
            visible: state is WeatherSuccess,
            replacement: NotSuccessWidget(state),
            child: Text(cubit.weather.location.country),
          );
        },
      ),
    );
  }
}
