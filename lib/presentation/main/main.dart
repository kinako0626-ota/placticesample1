import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:placticesample1/presentation/login/login_page.dart';
import 'package:placticesample1/presentation/top/top_page.dart';

// TODO: ログインされたらtrue
Future<bool> isLogin() async =>
    await FirebaseAuth.instance.currentUser() != null;

void main() async {
  //TODO: main内で非同期処理を呼び出す場合runApp前に初期化が必要
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      await isLogin(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  MyApp(this.isLogin);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLogin ? TopPage() : LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO:これいるか完成前に確認
            RaisedButton(
              child: Text('ログイン前'),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            RaisedButton(
              child: Text('ログイン後'),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TopPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
