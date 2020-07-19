import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  //TODO:なにかの通信をするロジック書く
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future SignUp() async {
    //TODO: if文　でバリデーション（入力されているかチェック）
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    //TODO:サインアップ
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: mail, password: password))
        .user;

    final email = user.email;
    Firestore.instance.collection('users').add(
      {
        'title': email,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
