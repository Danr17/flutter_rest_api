import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_rest_api/screens/homeScreen.dart';
import 'package:flutter_rest_api/models/block.dart';
import 'package:flutter_rest_api/models/currentTab.dart';

void main() => runApp(ItemsListApp());

class ItemsListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => BlockItem(),
        ),
        ChangeNotifierProvider(
          builder: (context) => CurrentTab(),
        )
      ],
      child: MaterialApp(
        title: 'Item List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          //        '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
