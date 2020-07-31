import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/login/login_model.dart';
import 'package:placticesample1/presentation/todo_list/todo_list_page.dart';
import 'package:placticesample1/presentation/top/top_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ログイン'),
        ),
        body: Consumer<LoginModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                    hintText: 'example@examle.com',
                  ),
                  onChanged: (text) {
                    model.mail = text;
                  },
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'パスワードを入力',
                  ),
                  obscureText: true,
                  onChanged: (text) {
                    model.password = text;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      try {
                        //
                        await model.Login();
                        _showDialog(context, 'ログインしました');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopPage(),
                          ),
                        );
                      } catch (e) {
                        //
                        _showDialog(context, e.toString());
                      }
                      await model.Login();
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future _showDialog(context, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
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
