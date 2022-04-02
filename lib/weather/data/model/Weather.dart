class Coordinate {
  double latitude;
  double longitude;

  Coordinate({
    required this.latitude,
    required this.longitude,
  });
}

class Weather {
  final String cityName;
  final double temperatureCelsius;
  final String mainWeather;
  final String weatherDescription;
  final int statusCode;

  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.mainWeather,
    required this.weatherDescription,
    required this.statusCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          runtimeType == other.runtimeType &&
          cityName == other.cityName &&
          temperatureCelsius == other.temperatureCelsius &&
          mainWeather == other.mainWeather &&
          weatherDescription == other.weatherDescription &&
          statusCode == other.statusCode;

  @override
  int get hashCode =>
      cityName.hashCode ^
      temperatureCelsius.hashCode ^
      mainWeather.hashCode ^
      weatherDescription.hashCode ^
      statusCode.hashCode;

  @override
  String toString() {
    return 'Weather{cityName: $cityName, temperatureCelsius: $temperatureCelsius, mainWeather: $mainWeather, weatherDescription: $weatherDescription, statusCode: $statusCode}';
  }

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'temperatureCelsius': temperatureCelsius,
      'mainWeather': mainWeather,
      'weatherDescription': weatherDescription,
      'statusCode': statusCode,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      cityName: map['name'] as String,
      temperatureCelsius: map['main']['temp'] as double,
      mainWeather: map['weather'][0]['main'] as String,
      weatherDescription: map['weather'][0]['description'] as String,
      statusCode: map['cod'] as int,
    );
  }
}
