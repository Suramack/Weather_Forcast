class WeatherModel {
  Main main;
  List<Weather> weather;
  Wind wind;
  int visibility;
  WeatherModel({this.main, this.weather, this.wind, this.visibility});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      visibility: (json['visibility']),
      weather: List<Weather>.from(
        json['weather'].map((x) => Weather.fromJson(x)),
      ),
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int humidity;

  Main({this.temp, this.feelsLike, this.tempMax, this.tempMin, this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        tempMin: json['temp_min'],
        humidity: json['humidity']);
  }
}

class Weather {
  String status;
  Weather({this.status});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      status: json['main'],
    );
  }
}

class Wind {
  double speed;
  Wind({this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
    );
  }
}
