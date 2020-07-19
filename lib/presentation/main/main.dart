import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/login/login_page.dart';
import 'package:placticesample1/presentation/signup/signup_page.dart';
import 'package:placticesample1/presentation/main/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      title: 'flutter',
      home: ChangeNotifierProvider<MainModel>(
        //TODO:画面を描画するときにMainModelも描画される
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        model.signInButton,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        model.loginButton,
                      ),
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 0, right: 20.0, bottom: 0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
