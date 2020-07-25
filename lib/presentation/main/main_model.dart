import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/add_todo/add_todo_page.dart';
import 'package:placticesample1/presentation/login/login_page.dart';
import 'package:placticesample1/presentation/signup/signup_page.dart';

class MainModel extends ChangeNotifier {
  String signInButton = '新規登録';
  String loginButton = 'ログイン';

  //TODO:新規登録ボタン
  RaisedButton createSignUpButton(BuildContext context) {
    return RaisedButton(
      child: Text(
        signInButton,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoPage(),
            ));
      },
    );
  }

//TODO: Padding
  Padding createBtnPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
    );
  }

  //TODO:ログインボタン
  RaisedButton createLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text(
        loginButton,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      },
    );
  }
}
