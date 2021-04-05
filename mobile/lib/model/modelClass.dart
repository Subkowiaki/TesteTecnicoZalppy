import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Model {
  final String url;

  ///Model deve ser instanciado com o url da rota
  Model({@required this.url});

  ///no metodo get devemos encaminhar uma header composta com um map
  Future get({@required Map<String, String> header}) async {
    var response;

    try {
      response = await http.get(url, headers: header);
    } catch (e) {
      response = {"status": "erro", "error": e};
    }
    return response;
  }
}
