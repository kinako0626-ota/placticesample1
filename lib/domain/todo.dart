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

class NotificationData {
  NotificationData({this.title, this.text, this.date, this.imageURL});
  final String title;
  final String text;

  final DateTime date;
  final String imageURL;
}
