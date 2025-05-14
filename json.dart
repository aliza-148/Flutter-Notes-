import 'dart:convert';
import 'package:flutter/material.dart';

class JsonScreen extends StatelessWidget {
  final String jsonData = '''
  [
    {"name": "Ali", "age": 25, "city": "Lahore"},
    {"name": "Sara", "age": 22, "city": "Karachi"},
    {"name": "Ahmed", "age": 28, "city": "Islamabad"}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> parsedData = jsonDecode(jsonData);

    return Scaffold(
      appBar: AppBar(title: Text("JSON Data")),
      body: ListView.builder(
        itemCount: parsedData.length,
        itemBuilder: (context, index) {
          var item = parsedData[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text("Age: ${item['age']}, City: ${item['city']}"),
          );
        },
      ),
    );
  }
}
