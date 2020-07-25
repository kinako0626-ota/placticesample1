import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/main/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: 'flutter',
      home: ChangeNotifierProvider<MainModel>(
        //TODO:画面を描画するときにMainModelも描画される
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        model.createSignUpButton(context),
                        model.createBtnPadding(),
                        model.createLoginButton(context)
                      ],
                    ),
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
