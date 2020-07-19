import 'package:placticesample1/presentation/signup/signup_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '新規登録',
          ),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                      hintText: 'example@example.com',
                    ),
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: 'パスワードを入力'),
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      child: Text('新規登録'),
                      onPressed: () async {
                        //
                        try {
                          //
                          await model.SignUp();
                          _showDialog(context, '登録完了しました');
                        } catch (e) {
                          //
                          _showDialog(context, e.toString());
                        }
                        await model.SignUp();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
//
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
