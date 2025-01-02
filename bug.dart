```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data successfully
      final jsonData = json.decode(response.body);
      // Access data using jsonData['key']
    } else {
      // Handle the error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions such as network issues or JSON decoding errors
    print('Error: $e');
    // Consider re-throwing to inform upper layers or implement retry logic
    rethrow; 
  }
}
```