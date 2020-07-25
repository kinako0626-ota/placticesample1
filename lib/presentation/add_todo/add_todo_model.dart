import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:placticesample1/domain/todo.dart';

class AddTodoModel extends ChangeNotifier {
  String todoTitle = '';
  File imageFile;

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future AddTodoFirebase() async {
    //タイトル未入力ならエラーを出す
    if (todoTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    Firestore.instance.collection('todos').add(
      {
        'title': todoTitle,
        'created_At': Timestamp.now(),
      },
    );
  }

  Future UpdateTodo(Todo todo) async {
    final document = Firestore.instance
        .collection('users')
        .document(todo.documentID)
        .collection('todos')
        .document(todo.documentID);
    await document.updateData({
      'title': todoTitle,
      'created_At': Timestamp.now(),
    });
  }
}
