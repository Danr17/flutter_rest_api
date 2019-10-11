import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/block.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api/widgets/ItemList.dart';
import 'package:flutter_rest_api/widgets/bottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlockItem blockitem = Provider.of<BlockItem>(context);
    blockitem.fetchItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Item List"),
      ),
      body: blockitem.listitems == null
          ? Center(child: CircularProgressIndicator())
          : ItemList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
