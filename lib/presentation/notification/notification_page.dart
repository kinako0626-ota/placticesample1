import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:placticesample1/domain/todo.dart';
import 'package:placticesample1/presentation/notification/notification_detail_page.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('お知らせ一覧'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '検索',
                  ),
                ),
                notificationList(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget notificationList(BuildContext context) {
  //仮
  final List<NotificationData> notifications = [
    NotificationData(
      title: 'お知らせ',
      text: 'サンプル',
      date: DateTime(2016, 3, 21),
    ),
    NotificationData(
      title: 'お知らせ',
      text: 'サンプル',
      date: DateTime(2016, 7, 13),
    ),
    NotificationData(
      title: 'お知らせ',
      text: 'サンプル',
      date: DateTime(2016, 5, 13),
    ),
    NotificationData(
      title: 'お知らせ',
      text: 'サンプル',
      date: DateTime(2016, 5, 13),
      imageURL:
          'https://image.itmedia.co.jp/nl/articles/1806/05/km1806_puni01.jpg',
    ),
  ];
  final List<Card> notificationCard = notifications
      .map(
        (notification) => Card(
          child: ListTile(
            title: Text(notification.title),
            subtitle: Text(
              DateFormat('yyyy/MM/dd').format(notification.date),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationDetail(notification),
                ),
              );
            },
          ),
        ),
      )
      .toList();
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: notificationCard,
  );
}
