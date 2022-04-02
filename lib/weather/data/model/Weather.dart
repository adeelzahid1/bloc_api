import 'dart:convert';

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

  Weather(
    this.cityName,
    this.temperatureCelsius,
    this.mainWeather,
    this.weatherDescription,
    this.statusCode,
  );

  Weather copyWith({
    String? cityName,
    double? temperatureCelsius,
    String? mainWeather,
    String? weatherDescription,
    int? statusCode,
  }) {
    return Weather(
      cityName ?? this.cityName,
      temperatureCelsius ?? this.temperatureCelsius,
      mainWeather ?? this.mainWeather,
      weatherDescription ?? this.weatherDescription,
      statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'cityName': cityName});
    result.addAll({'temperatureCelsius': temperatureCelsius});
    result.addAll({'mainWeather': mainWeather});
    result.addAll({'weatherDescription': weatherDescription});
    result.addAll({'statusCode': statusCode});
  
    return result;
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      map['cityName'] ?? '',
      map['temperatureCelsius']?.toDouble() ?? 0.0,
      map['mainWeather'] ?? '',
      map['weatherDescription'] ?? '',
      map['statusCode']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(cityName: $cityName, temperatureCelsius: $temperatureCelsius, mainWeather: $mainWeather, weatherDescription: $weatherDescription, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Weather &&
      other.cityName == cityName &&
      other.temperatureCelsius == temperatureCelsius &&
      other.mainWeather == mainWeather &&
      other.weatherDescription == weatherDescription &&
      other.statusCode == statusCode;
  }

  @override
  int get hashCode {
    return cityName.hashCode ^
      temperatureCelsius.hashCode ^
      mainWeather.hashCode ^
      weatherDescription.hashCode ^
      statusCode.hashCode;
  }
}
