/*                          

{

  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
 
  "main": {
    "temp": 282.55,
  },
  
  "name": "Mountain View",
  }                         

*/
class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempinfo;
  final WeatherInfo weatherinfo;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempinfo,
      required this.weatherinfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempinfojson = json['main'];
    final tempinfo = TemperatureInfo.fromJson(tempinfojson);

    final weatherInfojson = json['weather'][0];
    final weatherinfo = WeatherInfo.fromJson(weatherInfojson);

    return WeatherResponse(
        cityName: cityName, tempinfo: tempinfo, weatherinfo: weatherinfo);
  }
}

//To get temperature from json.
class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

//To get description and icon from json
class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}
