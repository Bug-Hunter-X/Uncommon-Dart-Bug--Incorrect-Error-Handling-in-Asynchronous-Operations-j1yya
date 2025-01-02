```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // More informative error handling
      throw Exception('API request failed with status: ${response.statusCode}.  Response body: ${response.body}');
    }
  } on SocketException catch (e) {
    // Handle network errors explicitly
    print('Network error: $e');
    throw Exception('Failed to connect to API: $e');
  } on FormatException catch (e) {
    // Handle JSON decoding errors separately
    print('JSON decoding error: $e');
    throw Exception('Invalid JSON response from API: $e');
  } catch (e) {
    // Handle other unexpected errors 
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw for upper layers to handle
  }
}
```