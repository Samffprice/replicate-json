/// Checks if you are awesome. Spoiler: you are.
//TODO: setup logging
//TODO: setup exceptions and error handling
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> create(
    String model, String apiKey, Map<String, Object> input) async {
  /* returns a json string that is the response body */
  String replicateApiToken = apiKey;

  // Replace with your actual endpoint
  String apiUrl = "https://api.replicate.com/v1/predictions";

  // Replace with your actual JSON payload

  var payload = {
    "version": model,
    "input": input,
  };
  var jsonPayload = jsonEncode(payload);
  Map<String, String> headers = {
    'Authorization': 'Token $replicateApiToken',
    'Content-Type': 'application/json',
  };

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonPayload,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body;
  } catch (error) {
    print('Error: $error');
    return "Error";
  }
}

Future<String> getPng(String id, String apiKey) async {
  String apiUrl = "https://api.replicate.com/v1/predictions/$id";
  String replicateApiToken = apiKey;
  Map<String, String> headers = {
    'Authorization': 'Token $replicateApiToken',
    'Content-Type': 'application/json',
  };

  try {
    var response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );
    print('Response status: ${response.statusCode}');
    print('Response body_1: ${response.body}');
    return response.body;
  } catch (error) {
    print('Error: $error');
    return "Error";
  }
}

Future<String> createAndGetJson(
    String model, String apiKey, Map<String, Object> input) async {
  // creates a prediction and returns a json string once completed
  var response = await create(model, apiKey, input);
  var responseJson = jsonDecode(response);
  String id = responseJson['id'];
  while (
      !['canceled', 'succeeded', 'failed'].contains(responseJson['status'])) {
    await Future.delayed(Duration(milliseconds: 250));
    response = await getPng(id, apiKey);
    responseJson = jsonDecode(response);
  }
  final result = await getPng(id, apiKey);
  return result;
}
