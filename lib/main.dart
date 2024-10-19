import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_storedata1/screen.dart';

void main() async {
  await Hive.initFlutter();
  var box =await Hive.openBox('myBox');
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home:HomeScreen (),
    );
  }
}
