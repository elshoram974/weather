import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mreweather/core/constants/app_constants.dart';

import '../../controller/weather_cubit/weather_cubit.dart';
import '../../controller/weather_cubit/weather_state.dart';
import '../../data/model/weather/include/current/current.dart';
import '../../data/model/weather/include/forecast/include/include/day.dart';
import '../../data/model/weather/include/forecast/include/include/hour_element.dart';
import '../../data/model/weather/include/location.dart';
import '../../generated/l10n.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/not_success_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherCubit>(context).getWeather(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Visibility(
            visible: state is WeatherSuccess,
            replacement: NotSuccessWidget(state),
            child: const DataWidget(),
          );
        },
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
    Location location = cubit.weather.location;
    Current current = cubit.weather.current;

    Day day = cubit.weather.forecast.forecastDays[0].day;

    List<HourElement> hours = cubit.weather.forecast.forecastDays[0].hours;

    S s = S.of(context);
    DateTime lastUpdated = DateTime.parse(current.lastUpdated);
    late HourElement hour;

    for (var h in hours) {
      if (DateTime.parse(h.time).hour == DateTime.now().hour) {
        hour = h;
        break;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          location.name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        Text(
          '${s.updated}: ${DateFormat("h:mm a").format(lastUpdated)}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        Row(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              hour.condition.assetsIcon,
              height: 100,
              width: 100,
            ),
            const Spacer(flex: 8),
            Text(
              '${hour.tempC} °',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(flex: 10),
            Text(
              '${s.max}: ${day.maxtempC} °\n${s.min}: ${day.mintempC} °',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(flex: 3),
          ],
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        Text(
          hour.condition.text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 5 * AppConstants.defaultPadding),
      ],
    );
  }
}
