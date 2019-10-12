import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/block_old.dart';
import 'package:flutter_rest_api/models/currentTab.dart';
import 'package:flutter_rest_api/screens/itemDetail.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlockItem blockitem = Provider.of<BlockItem>(context);
    final CurrentTab tab = Provider.of<CurrentTab>(context);

    return ListView.builder(
      itemCount: blockitem.listitems[tab.currentTab] == null
          ? 0
          : blockitem.listitems[tab.currentTab].length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          color: Colors.blue.shade50,
          child: ListTile(
            leading: getValidityIcon(
                blockitem.listitems[tab.currentTab][index].isValid,
                blockitem.listitems[tab.currentTab][index].targetAge),
            title: Text(blockitem.listitems[tab.currentTab][index].name),
            subtitle: Text(
                "Expires at: ${blockitem.listitems[tab.currentTab][index].expDate}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green.shade400,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetail(),
                ),
              );
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
