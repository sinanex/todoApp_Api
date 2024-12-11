import 'package:api/controller/provider.dart';
import 'package:api/view/add.dart';
import 'package:api/view/edit.dart';
import 'package:api/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderApi>(context).getTodo();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: CupertinoButton(
              child: const Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AddingPAge()));
              }),
          middle: const Text('Todo '),
        ),
        child: Consumer<ProviderApi>(builder: (context, value, child) {
          if (value.todoData.isEmpty) {
            return const Center(
              child: Text(
                "no data",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: value.todoData.length,
            itemBuilder: (context, index) {
              return CupertinoListTile(
                onTap: () {
                  Provider.of<displayData>(context, listen: false)
                      .display(value.todoData[index].id);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const DetailsPage()));
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => editPage(
                                  subtitlee: value.todoData[index].subtitle,
                                  titlee: value.todoData[index].title,
                                  id: value.todoData[index].id,
                                ),
                              ));
                        },
                        child: const Icon(CupertinoIcons.pencil)),
                    CupertinoButton(
                        onPressed: () {
                          Provider.of<ProviderApi>(context, listen: false)
                              .delete(value.todoData[index].id!);
                        },
                        child: const Icon(CupertinoIcons.delete)),
                  ],
                ),
                title: Text(value.todoData[index].title ?? 'No Title'),
                subtitle: Text(value.todoData[index].subtitle ?? 'No Subtitle'),
              );
            },
          );
        }));
  }
}
