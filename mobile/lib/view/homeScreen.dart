import 'package:flutter/material.dart';
import 'package:zallpy_teste/controller/askController.dart';
import 'package:zallpy_teste/view/awnserScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "images/zallpylogo.png",
          height: 50,
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: AskController().getAsk(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/loading.gif"),
                    Text("Aguarde...",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                            fontSize: 20))
                  ],
                );
              case ConnectionState.done:
                switch (snapshot.data["status"]) {
                  case 200:
                    return AwnserScreen(snapshot.data["body"]);
                  default:
                    return Center(
                      child: Image.asset("images/error.gif"),
                    );
                }
                return Container();
              default:
                return Container();
            }
          }),
    );
  }
}
