import 'package:flutter/material.dart';
import 'package:placticesample1/domain/todo.dart';
import 'package:placticesample1/presentation/add_todo/add_todo_model.dart';
import 'package:provider/provider.dart';

class AddTodoPage extends StatelessWidget {
  //イニシャライザ
  AddTodoPage({this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final bool isUpdeate = todo != null;
    final textEditingController = TextEditingController();

    if (isUpdeate) {
      textEditingController.text = todo.title;
    }

    return ChangeNotifierProvider<AddTodoModel>(
      create: (_) => AddTodoModel(),
      child: Scaffold(
        body: Consumer<AddTodoModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: InkWell(
                      onTap: () async {
                        //TODO:カメラロールを開く
                        await model.getImage();
                      },

                      //TODO:imageFileの有り、なしどちらかの場合で三項演算子使って切り分けする
                      child: model.imageFile != null
                          ? Image.file(model.imageFile)
                          : Container(
                              color: Colors.grey,
                              child: Icon(
                                Icons.add_photo_alternate,
                                size: 50,
                              ),
                            ),
                    ),
                  ),
                  TextField(
                    controller: textEditingController,
                    onChanged: (text) {
                      model.todoTitle = text;
                    },
                  ),
                  RaisedButton(
                    child: Text(isUpdeate ? '編集する' : '追加する'),
                    onPressed: () async {
                      if (isUpdeate) {
                        await updateTodo(model, context);
                      } else {
                        await addTodo(model, context);
                      }
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future addTodo(AddTodoModel model, BuildContext context) async {
    //
    try {
      await model.AddTodoFirebase();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('保存しました！'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  //
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    } catch (e) {
      //
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  //
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  Future updateTodo(AddTodoModel model, BuildContext context) async {
    //
    try {
      //
      await model.UpdateTodo(todo);
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('更新しました！'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  //
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    } catch (e) {
      //
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  //
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }
}
