import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  //TODO:なにかの通信をするロジック書く
  String mail = '';
  String password = '';

//TODO:バリデーション（メールとパスワードが空ならthrowを処理する）

  Future Login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }

    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    //TODO:ログイン機能実装メールアドレス、パスワードで
    try {
      //
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
    } catch (e) {
      //
      throw (_errorMessage(e.code));
    }
  }

  Future logout() {
    FirebaseAuth.instance.signOut();
  }
}

String _errorMessage(e) {
  //TODO:Error時のメッセージ
  switch (e) {
    case 'ERROR_INVALID_EMAIL':
      return 'メールアドレスを正しい形式で入力してください';
    case 'ERROOR_WRONG_PASSWORD':
      return 'パスワードが間違っています';
    case 'ERROR_USER_NOT_FOUND':
      return 'ユーザーが見つかりません';
    case 'ERROR_USER_DISABLED':
      return 'ユーザーが無効です';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'ログインに失敗しました。しばらくたってからやり直してください';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'ログインが許可されていません。管理者にご連絡ください';
    default:
      return '不明なエラー';
  }
}
