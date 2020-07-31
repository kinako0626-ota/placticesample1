import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/home/home_page_model.dart';
import 'package:placticesample1/presentation/notification/notification_page.dart';
import 'package:placticesample1/presentation/top/top_page_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<HomePageModel>(
      create: (_) => HomePageModel(),
      child: Consumer<TopPageModel>(
        builder: (context, model, child) {
          return Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: const Text(
                    'Loading.........',
                    style: TextStyle(
                      fontFamily: "ヒラギノ角ゴ ProN W3",
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 45, bottom: 38),
                  alignment: Alignment.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
