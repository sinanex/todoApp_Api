import 'package:api/controller/api.dart';
import 'package:api/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AddingPAge extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
   AddingPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: CupertinoTextField(
                controller: title,
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
                controller: subtitle,
                placeholder: 'subtitle',
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CupertinoColors.systemGrey,
                  )
                ),
              ),
          ),
          CupertinoButton(child: Text("submit"), onPressed: () {
           addData(context);
        
          },)
        ],
            ),
      ),);
  }
  
  void addData(BuildContext context) {
   final data = TodoModel(title: title.text, subtitle: subtitle.text);
   Provider.of<ApiProvider>(context,listen: false).postData(data);
        Navigator.pop(context);
  }
}