import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/block.dart';
import 'package:flutter_rest_api/models/currentTab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api/widgets/ItemList.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final BlockItem blockitem = Provider.of<BlockItem>(context);
    final CurrentTab tab = Provider.of<CurrentTab>(context);
    blockitem.fetchItems();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: blockitem.listitems == null
          ? Center(child: CircularProgressIndicator())
          : ItemList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade100,
        selectedItemColor: Colors.green,
        currentIndex: tab.currentTab,
        onTap: (value) {
          tab.currentTab = value;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('All')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            title: Text('Child')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Adult')
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
