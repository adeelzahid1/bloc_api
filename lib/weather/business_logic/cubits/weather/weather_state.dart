part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState{
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState{
  const WeatherLoaded();

}

class WeatherError extends WeatherState{
  const WeatherError();
}


