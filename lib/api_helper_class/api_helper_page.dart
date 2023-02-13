import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model_class.dart';



class APIHelper{

  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  List? storeData = [];

  Future<Jokes?> feachData() async {

    String api = "https://api.chucknorris.io/jokes/random";

    http.Response res = await http.get(Uri.parse(api));

    if(res.statusCode == 200){
      Map decodedData = json.decode(res.body);

      Jokes jokes = Jokes.fromjson(data: decodedData);

      return jokes;
    }
  }
}