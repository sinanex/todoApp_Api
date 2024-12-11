
import 'package:api/controller/provider.dart';

import 'package:api/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
 const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider(create: (context) => displayData(),),
    ChangeNotifierProvider(create: (context) => ProviderApi(),),
    // ChangeNotifierProvider(create: (context) => providerFetch(),),
      ],
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme:  CupertinoThemeData(
          brightness: Brightness.light,
        ),
        home: HomePage(),
      ),
    );
  }
}