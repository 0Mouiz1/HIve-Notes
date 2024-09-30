import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_hive/Views/screens/home.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
//   await Hive.initFlutter();
//  WidgetsFlutterBinding.ensureInitialized();

//   var box = await Hive.openBox('mybox');
//   runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade200),
        iconTheme: IconThemeData(color: Colors.yellow.shade200),
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[200],
        appBarTheme: AppBarTheme(
          color: Colors.yellow,
        ),
        //useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
