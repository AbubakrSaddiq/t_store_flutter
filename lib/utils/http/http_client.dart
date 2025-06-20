import 'dart:convert';
import 'package:http/http.dart' as http;

class SHttpHelper {
  static const String _baseUrl = 'https://yourapibaseurl.com';

  //helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

//helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
    headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  //helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  //handle the HTTP response
  static Future<Map<String, dynamic>> _handleResponse(http.Response response)  {
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
