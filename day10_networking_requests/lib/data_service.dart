import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToApi() async {
    final uri = Uri.https('api.first.org', 'data/v1/countries');
    final response = await http.get(uri);
    return response.body;
  }
}
