import 'dart:convert';

import 'package:http/http.dart' as http;

class DataService {
  void getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    //api.weatherstack.com
    final queryParameters = {
      'q': city,
      'appid': '29c4c2765fa1c0b8cda197e225f96eae',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    // final response = await http.get(Uri.parse(
    // 'https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=29c4c2765fa1c0b8cda197e225f96eae'));
    try {
      print("inside");
      print(response.body);
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print('failed');
      }
    } catch (e) {
      print(e);
    }
  }
}
