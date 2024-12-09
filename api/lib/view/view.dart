import 'package:api/controller/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<displayData>(context);

    final title = prov.titile ?? 'No Title Available';
    final subtitle = prov.subtitle ?? 'No Subtitle Available';

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("view page "),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title",style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),), 
              Text("$title"),
              SizedBox(height: 20,),
              Text("subtitle",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),), 
              Text("$subtitle"),
            ],
          ),
        ),
      ),
    );
  }
}
