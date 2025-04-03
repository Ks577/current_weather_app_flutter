import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/weather_info_widgets.dart';

class WeatherData extends StatelessWidget {
  final DateTime? date;
  final String? title;
  final String? iconCode;
  final String description;
  final double temp;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final double wind;
  final int pressure;
  final int humidity;
  final DateTime sunset;
  final DateTime sunrise;

  const WeatherData({
    super.key,
    required this.title,
    required this.temp,
    required this.iconCode,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.description,
    required this.sunset,
    required this.sunrise,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        weatherMainCard(
          '$temp°',
          "http://openweathermap.org/img/wn/$iconCode@4x.png",
          'Feels like $feelsLike°',
          '⇩$minTemp°',
          '⇧$maxTemp°',
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            weatherDetails('🌬\n$wind\nm/s'),
            weatherDetails('hPa\n$pressure'),
            weatherDetails('💧\n$humidity%'),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sunInfoCard(
              DateFormat.jm().format(sunrise),
              DateFormat.jm().format(sunset),
            ),
          ],
        ),
      ],
    );
  }
}
