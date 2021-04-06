import 'package:flutter/material.dart';
import 'package:zallpy_teste/view/homeScreen.dart';

class FinalScreen extends StatelessWidget {
  final int right;
  final int total;
  FinalScreen({@required this.total, @required this.right});

  @override
  Widget build(BuildContext context) {
    double percentage = 100 / total.toDouble() * right.toDouble();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            "images/zallpylogo.png",
            height: 50,
          ),
        ),
        body: Stack(
          children: [
            percentage < 50
                ? Container()
                : Image.asset("images/finish.gif",
                    color: Color.fromRGBO(000, 255, 000, 0.1),
                    colorBlendMode: BlendMode.modulate),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/finishline.png"),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      percentage < 50
                          ? "Você acertou:"
                          : "Parabéns! \n Você acertou:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          shadows: [
                            Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                                color: Colors.grey[900].withOpacity(0.3)),
                          ]),
                    ),
                  ),
                  Text(
                    "$percentage %",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                              color: Colors.grey[900].withOpacity(0.3)),
                        ]),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "Refazer o teste!",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
