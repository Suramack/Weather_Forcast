import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:wheather_forcast/services/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheather_forcast/services/weather.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  DateTime dayTime = DateTime.now();
  double _width = 0, _height = 0;
  List<int> _hourList = <int>[];
  String hour;
  String railHour;
  int dayTypeIndex;
  double currentTemp;
  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      getPlaceMark(position.latitude, position.longitude).then((data) {
        getWeatherData(position.latitude, position.longitude).then((weather) {
          setState(() {
            currentTemp = weather.main.temp;
          });
        });
      });
    });

    hour = DateFormat('h').format(dayTime);
    railHour = DateFormat('kk').format(dayTime);
    addHours();
    dayTypeIndex = getDayStatus();
  }

  addHours() {
    for (int i = 0; i <= int.parse(hour); i++) {
      _hourList.add(i);
    }
  }

  int getDayStatus() {
    if (int.parse(railHour) <= 6) {
      return 0;
    } else if (int.parse(railHour) > 6 && int.parse(railHour) < 12) {
      return 1;
    } else if (int.parse(railHour) == 12) {
      return 2;
    } else if (int.parse(railHour) > 12 && int.parse(railHour) < 17) {
      return 3;
    } else if (int.parse(railHour) >= 17 && int.parse(railHour) < 19) {
      return 4;
    } else {
      return 5;
    }
  }

  //Day status text style
  TextStyle dayTextStyle() {
    return (TextStyle(color: Colors.white, fontSize: 17));
  }

  @override
  Widget build(BuildContext context) {
    List<Color> _weatherColor = <Color>[
      Colors.brown[300],
      Colors.lightBlue[200],
      Colors.blue[400],
      Colors.lightBlue[700],
    ];
    List<Text> _dayType = <Text>[
      Text(
        'Early Morning',
        style: dayTextStyle(),
      ),
      Text(
        'Morning',
        style: dayTextStyle(),
      ),
      Text(
        'Noon',
        style: dayTextStyle(),
      ),
      Text(
        'After Noon',
        style: dayTextStyle(),
      ),
      Text(
        'Evening',
        style: dayTextStyle(),
      ),
      Text(
        'Night',
        style: dayTextStyle(),
      ),
    ];
    List<Image> _weatherImage = <Image>[
      Image.asset(
        'assets/weather0.png',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/weather1.png',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/weather2.png',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/weather3.png',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/weather4.png',
        fit: BoxFit.cover,
      ),
    ];
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        // showing  weather
        Container(
          width: _width * .95,
          height: _height * .3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _weatherColor[0],
              boxShadow: [
                BoxShadow(blurRadius: 3, color: Colors.grey),
              ]),
          child: currentTemp == null
              ? SpinKitThreeBounce(
                  color: Colors.grey,
                )
              : Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          child: Container(
                            width: 125,
                            height: 125,
                            child: _weatherImage[0],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                '$currentTemp',
                                style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "feels like",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Rain Status',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 21.0),
                      child: _dayType[dayTypeIndex],
                    ),
                    Spacer(),
                  ],
                ),
        ),
        SizedBox(
          height: 20.0,
        ),
        // Wind Humidity Visibility
        Container(
          width: _width * .95,
          height: _height * .1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey,
                )
              ]),
          child: Row(
            children: [
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Wind',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 15),
                          ),
                        ),
                        Container(
                          child: Text(
                            '33m/h',
                            style: TextStyle(
                              fontWeight: FontWeight.values[6],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      child: Text(
                        'Humidity',
                        style: TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Text(
                        '23km/h',
                        style: TextStyle(
                          fontWeight: FontWeight.values[6],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      child: Text(
                        'Visibility',
                        style: TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Text(
                        '64%',
                        style: TextStyle(
                          fontWeight: FontWeight.values[6],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        //Today's Temporature
        SizedBox(
          height: 20.0,
        ),
        Container(
          width: _width * .95,
          height: _height * .33,
          child: Column(
            children: [
              Container(
                child: Text('Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.values[7],
                    )),
              ),
              Spacer(),
              //today dash bord of temparature
              Container(
                height: 80.0,
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: int.parse(hour) + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Center(
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(),
                                // boxShadow: [
                                //   BoxShadow(blurRadius: .3, color: Colors.grey)
                                // ],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  _hourList[index].toString(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    endIndent: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
