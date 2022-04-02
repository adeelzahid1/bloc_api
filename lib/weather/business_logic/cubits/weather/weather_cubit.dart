import 'package:bloc/bloc.dart';
import 'package:bloc_api/weather/data/model/Weather.dart';
import 'package:bloc_api/weather/data/repository/weatherRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherInitial());

  Future getWeather(String cityName) async{
    try {
      emit(const WeatherLoading());
        WeatherApiAdapter adapter = WeatherApiAdapter.withCity(cityName);
        var weatherJsonData = await adapter.getWeatherData();
        print('Json Data Comming from ... $weatherJsonData');
        Weather weather = Weather.fromMap(weatherJsonData);
        print('Json After Converting to Object');
        print(weather);
        emit(WeatherLoaded(weather));
    }
    on NetworkException catch(e){
        emit(WeatherError( "${e.toString()}\nCouldn't fetch weather. Please check the city name."));
    }
  }

  void init(){
    emit  (const WeatherInitial());
  }

}
