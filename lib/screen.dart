import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box box;
  String? username;

  @override
  void initState() {
    super.initState();
    box = Hive.box('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Example'),
      ), 
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              box.put('username', 'JohnDoe');
            },
            child: Text('Store Data'),
          ), 
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              setState(() {
                username = box.get('username');
              });
            },
            child: Text('Retrieve Data'),
          ), 
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              username != null ? 'Stored Username: $username' : 'No data yet',
              style: TextStyle(fontSize: 18),
            ), 
          ), 
        ],
      ), 
    ); 
  }
}
