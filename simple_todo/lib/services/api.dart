import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String host = "http://localhost:5000";



Future<Map<String,dynamic>> getMessage()async{
  final server = Uri.parse(host);
  final response = await http.get(server);
  return jsonDecode(response.body);
}

Future<List<Map<String, dynamic>>> getToDos() async {
  final path = "$host/retrieve_all";
  final server = Uri.parse(path);

  final response = await http.get(server);

  if (response.statusCode == 200) {
    // Try to decode the JSON if the response is successful
    return List<Map<String, dynamic>>.from(jsonDecode(response.body));
  } else {
    // If the server returns a response other than 200, handle the error
    throw Exception('Failed to load todos. Status code: ${response.statusCode}, Body: ${response.body}');
  }
}

Future<void> createToDo(Map<String,dynamic> task)async{
  final path = "$host/create_new";
  final json_form = jsonEncode(task);
  final server = Uri.parse(path);
  await http.post(server,headers:{
    'Content-type': 'application/json',
  },
  body: json_form
  );
  debugPrint("Task Created");
}


Future<void> deleteToDo(int id)async{
  final path = "$host/delete_task/$id";
  final server = Uri.parse(path);
  await http.delete(server);
  debugPrint("Task Deleted");
}