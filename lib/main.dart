import 'package:flutter/material.dart';
import 'package:flutter_rest_api/notifiers/block.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api/pages/widget_Item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => BlockItem(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Item List'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final BlockItem blockitem = Provider.of<BlockItem>(context);
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
