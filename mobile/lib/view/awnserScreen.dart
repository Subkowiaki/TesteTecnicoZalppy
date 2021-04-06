import 'package:flutter/material.dart';
import 'package:zallpy_teste/controller/askController.dart';
import 'package:zallpy_teste/view/finalScreen.dart';

class AwnserScreen extends StatefulWidget {
  final List questions;
  AwnserScreen(this.questions);

  @override
  _AwnserScreenState createState() => _AwnserScreenState(questions);
}

class _AwnserScreenState extends State<AwnserScreen> {
  final List _questions;
  _AwnserScreenState(this._questions);
  int totalRight = 0;
  int awnserIndex = 0;
  int awnser = 0;

  void showDiolog(bool isRight) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                isRight ? "Parabéns você acertou!" : "Ops! você errou..",
                style: TextStyle(color: Colors.white)),
            content:
                Image.asset(isRight ? "images/check.gif" : "images/erro.gif"),
            backgroundColor: isRight ? Color(0xff12c06a) : Colors.white,
            actions: [
              FlatButton(
                child: Text("PRÓXIMA PERGUNTA",
                    style:
                        TextStyle(color: isRight ? Colors.white : Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Image.asset("images/questions.gif"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${awnserIndex + 1}/${_questions.length} Em qual país foi fundada a marca '${_questions[awnserIndex]["question"]}' ?",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        RadioListTile(
            value: 0,
            groupValue: awnser,
            title: Text("Inglaterra"),
            onChanged: (value) {
              setState(() {
                awnser = value;
              });
            }),
        RadioListTile(
            value: 1,
            groupValue: awnser,
            title: Text("USA"),
            onChanged: (value) {
              setState(() {
                awnser = value;
              });
            }),
        RadioListTile(
            value: 2,
            groupValue: awnser,
            title: Text("Alemanha"),
            onChanged: (value) {
              setState(() {
                awnser = value;
              });
            }),
        RadioListTile(
            value: 3,
            groupValue: awnser,
            title: Text("Japão"),
            onChanged: (value) {
              setState(() {
                awnser = value;
              });
            }),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: MaterialButton(
            onPressed: () {
              bool isCheck = AskController().awnser(
                  response: awnser,
                  rightReponse: _questions[awnserIndex]["correct"]);

              isCheck ? totalRight++ : totalRight = totalRight;
              if (awnserIndex + 1 == _questions.length) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FinalScreen(
                              total: _questions.length,
                              right: totalRight,
                            )));
              } else {
                setState(() {
                  awnser = 0;
                  awnserIndex++;
                });
                showDiolog(isCheck);
              }
            },
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    awnserIndex + 1 == _questions.length
                        ? "Finalizar"
                        : "Responder",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        )
      ],
    ));
  }
}
