import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:placticesample1/domain/todo.dart';

class NotificationDetail extends StatelessWidget {
  NotificationDetail(this.notification);

  final NotificationData notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    notification.title,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(DateFormat('yyyy/MM/dd').format(notification.date)),
                ],
              ),
            ),
            (notification.imageURL == null)
                ? SizedBox(height: 10)
                : Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(notification.imageURL),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              notification.text,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
