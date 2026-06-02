import 'package:flutter/material.dart';

import '../components/info_card.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherService = WeatherService();
  Weather? weather;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    setState(() => isLoading = true);
    final result = await weatherService.getWeather('Istanbul');
    setState(() {
      weather = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWeather = weather;

    return Padding(
      padding: const EdgeInsets.all(25),
      child: isLoading && currentWeather == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather API',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                if (currentWeather != null)
                  InfoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentWeather.city,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${currentWeather.temperature.toStringAsFixed(0)}°C',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(currentWeather.condition),
                        const Divider(),
                        Text('Humidity: ${currentWeather.humidity}%'),
                        Text('Wind: ${currentWeather.windSpeed} km/h'),
                      ],
                    ),
                  ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : fetchWeather,
                    child: const Text('Refresh Weather'),
                  ),
                ),
              ],
            ),
    );
  }
}
