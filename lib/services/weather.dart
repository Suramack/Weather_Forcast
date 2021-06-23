import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wheather_forcast/Models/weatherModel.dart';

Future<WeatherModel> getWeatherData(double latitude, double longitude) async {
  String api = 'api.openweathermap.org/data/2.5/weather';
  String appId = '2d90b6e4f9b11d3317d84aa94de16849';
  String url = 'https://$api?lat=$latitude&lon=$longitude&APPID=$appId';
  http.Response response = await http.get(Uri.parse(url));
  print(response.body);
  WeatherModel parsed = WeatherModel.fromJson(jsonDecode(response.body));
  return parsed;
}
