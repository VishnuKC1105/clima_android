import 'package:clima_android/data_srevice.dart';
import 'package:clima_android/json_model.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Column(
                children: [
                  Image.network(_response!.iconUrl),
                  Text(
                    '${_response?.tempinfo.temperature}°',
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(_response!.weatherinfo.description)
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'city..',
                  ),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _search,
              child: Text(
                'Search',
                style: TextStyle(color: Colors.teal),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.white),
            )
          ],
        )),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityController.text);

    setState(() => _response = response);

    // print(response.cityName);
    // print(response.tempinfo.temperature);
    // print(response.weatherinfo.description);
    // print(response.weatherinfo.icon);
  }
}
