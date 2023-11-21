/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemDetailScreen extends StatelessWidget {
  final int itemId;

  ItemDetailScreen(this.itemId);

  Future<Map<String, dynamic>> fetchItemDetail() async {
    final response = await http.get('http://127.0.0.1:8000/id/');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load item detail');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchItemDetail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final itemDetail = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Item Details'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${itemDetail['name']}'),
                Text('Amount: ${itemDetail['amount']}'),
                Text('Description: ${itemDetail['description']}'),
                // Add more Text widgets for other attributes
              ],
            ),
          );
        }
      },
    );
  }
}

*/
