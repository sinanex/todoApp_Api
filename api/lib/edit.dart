import 'package:api/api.dart';
import 'package:api/model.dart';
import 'package:flutter/cupertino.dart';

class editPage extends StatelessWidget {
  String? id;

  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();

  editPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoTextField(
                controller: title,
                placeholder: 'title',
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CupertinoColors.systemGrey,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoTextField(
                controller: subtitle,
                placeholder: 'subtitle',
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CupertinoColors.systemGrey,
                    )),
              ),
            ),
            CupertinoButton(
              child: Text("submit"),
              onPressed: () {
                editDatabtn(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void editDatabtn(BuildContext context) {
    final data = TodoModel(title: title.text, subtitle: subtitle.text);
      editData(id: id!, todoData: data);
      Navigator.pop(context);
  }
}
