import 'package:api/api.dart';
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
      navigationBar: CupertinoNavigationBar(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title), 
            Text(subtitle), 
          ],
        ),
      ),
    );
  }
}
