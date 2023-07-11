import 'dart:convert';

import 'package:dad_jokes_api/model/joke_model.dart';
import 'package:http/http.dart' as http;

getJokes() async {
  var url = Uri.parse("https://icanhazdadjoke.com");
  var response = await http.get(url, headers: {'Accept': "application/json"});
  var json = jsonDecode(response.body);

  return JokeModel.fromJson(json);
}
