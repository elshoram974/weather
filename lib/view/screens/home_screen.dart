import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/weather_cubit/weather_cubit.dart';
import '../../controller/weather_cubit/weather_state.dart';
import '../../generated/l10n.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
    cubit.getWeather();

    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          // cubit.controller.
          // cubit.controller.dispose();

          return Visibility(
            visible: state is! WeatherInitial,
            replacement: Center(
                child: Text(
              S.of(context).thereIsNoSelectedPlace,
              textAlign: TextAlign.center,
            )),
            child: Text(BlocProvider.of<WeatherCubit>(context).q),
          );
        },
      ),
    );
  }
}
