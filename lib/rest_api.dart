import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

weatherGetRequest() async{
  Uri url = Uri.parse("");

  Response response = await http.get(url);

  final decodedResponse = jsonDecode(response.body);

  if(response.statusCode == 200){}
}