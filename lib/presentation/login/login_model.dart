import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  //TODO:なにかの通信をするロジック書く
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
//TODO:バリデーション（メールとパスワードが空ならthrowを処理する）

  Future Login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }

    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    //TODO:ログイン機能実装メールアドレス、パスワードで
    final result = _auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
  }
}
