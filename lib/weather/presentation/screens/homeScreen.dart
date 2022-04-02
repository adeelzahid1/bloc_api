import 'package:bloc_api/weather/business_logic/cubits/weather/weather_cubit.dart';
import 'package:bloc_api/weather/data/model/Weather.dart';
import 'package:bloc_api/weather/presentation/widgets/cityInput.dart';
import 'package:bloc_api/weather/presentation/widgets/cityWeather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(	
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return buildInitial(context);
          } else if (state is WeatherLoading) {
            return buildLoading();
          } else if (state is WeatherLoaded) {
            return buildWeatherData(context, state.weather);
          } else {
            return buildInitial(context);
          }
        },
      ),
    );
  }

  Widget buildInitial(BuildContext context) {
    return Center(
      child: CityInput(
        onSubmitted: (inputValue) {
          String city = inputValue.trim();
          final weatherCubit = context.read<WeatherCubit>();
          weatherCubit.getWeather(city);
        },
      ),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
  Widget buildWeatherData(BuildContext context, Weather weather) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        backButton(context),
        const SizedBox(height: 120.0),
        CityWeather(weather: weather),
      ],
    );
  }

  IconButton backButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.chevron_left,
        size: 32.0,
      ),
      onPressed: () {
        context.read<WeatherCubit>().init();
      },
    );
  }
}
