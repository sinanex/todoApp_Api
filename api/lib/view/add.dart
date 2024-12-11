
import 'package:api/controller/provider.dart';
import 'package:api/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddingPAge extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
   AddingPAge({super.key});

  @override
  Widget build(BuildContext context) {
   final todo = Provider.of<ProviderApi>(context,listen: false);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: CupertinoTextField(
                controller: todo.titleController,
                placeholder: 'title',
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CupertinoColors.systemGrey,
                  )
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: CupertinoTextField(
                controller: todo.subtitleController,
                placeholder: 'subtitle',
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CupertinoColors.systemGrey,
                  )
                ),
              ),
          ),
          CupertinoButton(child: const Text("submit"), onPressed: () {
           addData(context);
          },)
        ],
            ),
      ),);
  }
  
  void addData(BuildContext context) {
   Provider.of<ProviderApi>(context,listen: false).addData();
        Navigator.pop(context);
  }
}