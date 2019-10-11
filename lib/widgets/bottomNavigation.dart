import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/currentTab.dart';
import 'package:provider/provider.dart';


class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final CurrentTab tab = Provider.of<CurrentTab>(context);

    return BottomNavigationBar(
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
      );
  }
}