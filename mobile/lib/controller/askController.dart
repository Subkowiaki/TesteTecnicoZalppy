import 'package:flutter/cupertino.dart';
import 'package:zallpy_teste/model/modelClass.dart';

class AskController {
  Future getAsk() async {
    Map response =
        await Model(url: 'https://testezalppy.web.app/asking').get(header: {});

    return response;
  }

  bool awnser({@required int response, @required int rightReponse}) {
    bool status = response == rightReponse ? true : false;

    return status;
  }
}
