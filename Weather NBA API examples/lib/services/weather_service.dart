import '../models/weather.dart';

class WeatherService {
  Future<Weather> getWeather(String city) async {
    await Future<void>.delayed(const Duration(milliseconds: 650));

    return Weather(
      city: city,
      temperature: 29,
      condition: 'Partly cloudy',
      humidity: 62,
      windSpeed: 11.5,
    );
  }
}
