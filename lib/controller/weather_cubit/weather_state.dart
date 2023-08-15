abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherIsLoaded extends WeatherState {}
final class WeatherSuccess extends WeatherState {}
final class WeatherFailure extends WeatherState {}
