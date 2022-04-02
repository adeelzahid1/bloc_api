import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApiAdapter{
 final kOpenWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
  final kWeatherApiId = '7d681a760a81ba5b863c0cca27585d6d';

  late String city;
  late String url;
  late Uri _uri;

  WeatherApiAdapter.withCity(this.city) : url = ''{
    _uri = Uri.parse('$kOpenWeatherURL?q=$city&units=metric&appid=$kWeatherApiId');
  }

  WeatherApiAdapter.withUrl(this.url) : city = ''{
    _uri = Uri.parse(url);
  }

  Future getWeatherData() async{
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      print('data access ');
      String data = response.body;
      return jsonDecode(data);
    }
    else{
      throw NetworkException(response.statusCode);
    }
  }
}

class NetworkException implements Exception {
  NetworkException(this.statusCode);
  final int statusCode;

  @override
  String toString() => 'NetworkException(statusCode: $statusCode)';
}

