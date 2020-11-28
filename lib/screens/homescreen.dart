import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nisema_project/screens/pressure.dart';
import 'package:nisema_project/screens/weather.dart';
import 'package:nisema_project/screens/windspeed.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dateController = TextEditingController();
  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('London Location')),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: TextField(
                decoration: InputDecoration(hintText: 'YYYY-MM-DD'),
                textAlign: TextAlign.center,
                controller: dateController,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Weather(
                              date: dateController.text,
                            )));
              },
              child: const Text('Weather', style: TextStyle(fontSize: 15.6)),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Windspeed(
                              date: dateController.text,
                            )));
              },
              child: const Text('Pressure', style: TextStyle(fontSize: 15.6)),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pressure(
                              date: dateController.text,
                            )));
              },
              child: const Text('Wind Speed', style: TextStyle(fontSize: 15.6)),
            ),
            RaisedButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('Exit', style: TextStyle(fontSize: 15.6)),
            ),
          ]),
    );
  }
}
