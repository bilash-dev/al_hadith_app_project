import 'package:al_hadiths_app/db/database_helper.dart';
import 'package:al_hadiths_app/screens/dashboard.dart';
import 'package:al_hadiths_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().copyDatabase();
   // await DatabaseHelper.initDatabase();
   Database database = await DatabaseHelper.initDatabase();
  runApp(MyApp(database: database));
}


class MyApp extends StatelessWidget {
   Database database;
   MyApp({super.key, required this.database});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(database: database),
    );
  }
}

