import 'package:api/add.dart';
import 'package:api/api.dart';
import 'package:api/edit.dart';
import 'package:api/model.dart';
import 'package:api/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<TodoModel>> todoData;

  @override
  void initState() {
    super.initState();
    todoData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Todo 💔'),
      ),
      child: Stack(
        children: [
          FutureBuilder<List<TodoModel>>(
            future: todoData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                List<TodoModel> todos = snapshot.data!;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return CupertinoListTile(
                      onTap: () {
                        Provider.of<displayData>(context, listen: false)
                            .display(todos[index].id);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailsPage()));
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => editPage(
                                        id: todos[index].id,
                                      ),
                                    ));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                deleteData(todos[index].id!);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                      title: Text(todos[index].title ?? 'No Title'),
                      subtitle: Text(todos[index].subtitle ?? 'No Subtitle'),
                    );
                  },
                );
              }
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddingPAge()),
                );
              },
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "ADD TODO",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
