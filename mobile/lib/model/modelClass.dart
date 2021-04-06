import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Model {
  final String url;

  ///Model deve ser instanciado com o url da rota
  Model({@required this.url});

  ///no metodo get devemos encaminhar uma header composta com um map
  Future get({@required Map<String, String> header}) async {
    Map response = {};

    try {
      var apiResponse = await http.get(url, headers: header);
      response["status"] = apiResponse.statusCode;
      response["body"] = jsonDecode(apiResponse.body);
    } catch (e) {
      response = {"status": 1, "body": e};
    }
    return response;
  }
}
