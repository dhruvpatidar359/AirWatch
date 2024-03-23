import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenWeatherMapApi {
  final String apiKey = "b08e114614237588ee72b8a7cbb0c3c9";
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/air_pollution';

  Future<int?> fetchAirQuality(double lat, double lon) async {
    final url = '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final aqi = jsonData['list'][0]['main']['aqi'];
        return aqi;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
