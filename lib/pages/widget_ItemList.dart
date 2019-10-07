import 'package:flutter/material.dart';
import 'package:flutter_rest_api/notifiers/block.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final block = Provider.of<BlockItem>(context);

    return ListView.builder(
      itemCount: block.listitems[block.currentTab] == null ? 0 : block.listitems[block.currentTab].length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          color: Colors.blue.shade50,
          child: ListTile(
            leading: getValidityIcon(block.listitems[block.currentTab][index].isValid, block.listitems[block.currentTab][index].targetAge),
            title: Text(block.listitems[block.currentTab][index].name),
            subtitle: Text("Expires at: ${block.listitems[block.currentTab][index].expDate}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green.shade400,
            ),
            onTap: () {
            },
          ),
        );
      },
    );
  }
}

//Returns the Icon type based on validity
Icon getValidityIcon(bool value, String age) {
   if (age == "child") { 
  switch (value) {
    case true:
      return Icon(
        Icons.child_care,
        color: Colors.green,
      );
      break;
    case false:
      return Icon(
        Icons.child_care,
        color: Colors.red,
      );
      break;
    default:
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.teal,
      );
  }
  } else {
    switch (value) {
    case true:
      return Icon(
        Icons.person,
        color: Colors.green,
      );
      break;
    case false:
      return Icon(
        Icons.person,
        color: Colors.red,
      );
      break;
    default:
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.teal,
      );
  }
  }
}
