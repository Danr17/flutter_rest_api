import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/block.dart';
import 'package:flutter_rest_api/models/item.dart';
import 'package:flutter_rest_api/models/currentTab.dart';
import 'package:flutter_rest_api/screens/itemDetail.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlockItem blockitem = Provider.of<BlockItem>(context);
    final CurrentTab tab = Provider.of<CurrentTab>(context);

    List<Item> selectItem() {
      List<Item> selectedList;

      switch (tab.currentTab) {
        case 0:
          selectedList = blockitem.listitems;
          break;
        case 1:
          selectedList = blockitem.childitems;
          break;
        case 2:
          selectedList = blockitem.adultitems;
          break;
      }

      return selectedList;
    }

    List<Item>selectedList = selectItem();

    return ListView.builder(
      itemCount: blockitem.listitems[tab.currentTab] == null
          ? 0
          : selectedList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          color: Colors.blue.shade50,
          child: ListTile(
            leading: getValidityIcon(
                selectedList[index].isValid,
                selectedList[index].targetAge),
            title: Text(selectedList[index].name),
            subtitle: Text(
                "Expires at: ${selectedList[index].expDate}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green.shade400,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetail(itemDetailed: selectedList[index]),
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
