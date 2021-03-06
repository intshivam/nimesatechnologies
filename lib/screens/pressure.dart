import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'constant.dart';

class Pressure extends StatefulWidget {
  final String date;
  Pressure({Key key, @required this.date}) : super(key: key);
  @override
  _PressureState createState() => _PressureState();
}

class _PressureState extends State<Pressure> {
  static String pressure = 'Error';

  void getData() async {
    // var test1 = '2019-03-27 19:00:00';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      for (int i = 0; i < jsonDecode(data)['list'].length; i++) {
        var dateTimenew =
            jsonDecode(data)['list'][i]['dt_txt'].toString().split(" ");
        if (widget.date == dateTimenew[0]) {
          pressure = jsonDecode(data)['list'][i]['wind']['speed'].toString();
          print(jsonDecode(data)['list'][i]['main']['pressure']);
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
              "WindSpeed is",
              style: TextStyle(color: Colors.blue, fontSize: 35.2),
            ),
            SizedBox(
              height: 20,
            ),
            Text(pressure,
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
