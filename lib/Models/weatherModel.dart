class WeatherModel {
  Main main;
  WeatherModel({this.main});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(main: Main.fromJson(json['main']));
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;

  Main({this.temp, this.feelsLike, this.tempMax, this.tempMin});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
    );
  }
}
