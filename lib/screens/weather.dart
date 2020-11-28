import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nisema_project/screens/constant.dart';

class Weather extends StatefulWidget {
  final String date;
  Weather({Key key, @required this.date}) : super(key: key);
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  static String temprature = 'ERROR';
  // var test1;

  void getData() async {
    // var test1 = '2019-03-27 19:00:00';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      for (int i = 0; i < jsonDecode(data)['list'].length; i++) {
        var dateTimenew =
            jsonDecode(data)['list'][i]['dt_txt'].toString().split(" ");
        if (widget.date == dateTimenew[0]) {
          temprature = jsonDecode(data)['list'][i]['main']['temp'].toString();
          print(jsonDecode(data)['list'][i]['main']['temp']);
          // print(dateTimenew[1]);
          break;
        }
      }
      // var code = jsonDecode(data)['list'][0]['main']['temp_min'];
      // print(code);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Weather is",
              style: TextStyle(color: Colors.blue, fontSize: 35.2),
            ),
            SizedBox(
              height: 20,
            ),
            Text(temprature,
                style: TextStyle(color: Colors.blue, fontSize: 70.2)),
            SizedBox(
              height: 60,
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back', style: TextStyle(fontSize: 15.6)))
          ],
        ),
      ),
    );
  }
}
