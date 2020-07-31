import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/add_todo/add_todo_page.dart';
import 'package:placticesample1/presentation/home/home_page.dart';
import 'package:placticesample1/presentation/login/login_model.dart';
import 'package:placticesample1/presentation/login/login_page.dart';
import 'package:placticesample1/presentation/mypage/mypage.dart';
import 'package:placticesample1/presentation/notification/notification_page.dart';
import 'package:placticesample1/presentation/top/top_page_model.dart';
import 'package:provider/provider.dart';

class TopPage extends StatelessWidget {
  final List<Widget> _children = [HomePage(), MyPage(), AddTodoPage()];
  final List<String> _tabNames = ['ホーム', 'マイページ', 'TODOを追加'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopPageModel>(
      create: (_) => TopPageModel()..init(),
      child: Consumer<TopPageModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(_tabNames[model.currentIndex]),
              leading: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              backgroundColor: Colors.blue,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    LoginModel().logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                )
              ],
            ),
            body: _children[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: model.onTabTap,
              currentIndex: model.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(_tabNames[0]),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  title: Text(_tabNames[1]),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.note_add),
                  title: Text(_tabNames[2]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
