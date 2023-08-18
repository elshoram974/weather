import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'controller/weather_cubit/weather_cubit.dart';
import 'controller/weather_cubit/weather_state.dart';
import 'core/services/all_services.dart';
import 'generated/l10n.dart';
import 'routes_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await allServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WeatherCubit()),
      ],
      child: const StartApp(),
    );
  }
}

class StartApp extends StatelessWidget {
  const StartApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);

    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) => current is WeatherSuccess,
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          title: 'Weather App',
          initialRoute: AppRoutManger.homePage,
          routes: AppRoutManger.routes,

          theme: ThemeData(primarySwatch: cubit.primarySwatch),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
