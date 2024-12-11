import 'package:api/controller/provider.dart';
import 'package:api/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class editPage extends StatefulWidget {
  String? id;
  String? titlee;

  String? subtitlee;
  editPage(
      {super.key,
      required this.id,
      required this.subtitlee,
      required this.titlee});

  @override
  State<editPage> createState() => _editPageState();
}

// ignore: camel_case_types
class _editPageState extends State<editPage> {
  TextEditingController title = TextEditingController();

  TextEditingController subtitle = TextEditingController();
  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.titlee);
    subtitle = TextEditingController(text: widget.subtitlee);
  }

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
              child: const Text("submit"),
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
    final titileData = title.text.trim();
    final subtitileData = subtitle.text.trim();
    Provider.of<ProviderApi>(context, listen: false)
        .update(id: widget.id!, title: titileData, subtile: subtitileData);
     Navigator.pop(context);
  }
}
