import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  //TODO: 要素としてのモデルを書く

  Todo(DocumentSnapshot doc) {
    documentID = doc.documentID;
    title = doc['title'];
  }
  String documentID;
  String title;
}
