import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rest_api/models/item.dart';
import 'package:http/http.dart' as http;

class BlockItem with ChangeNotifier {
  List<Item> _items;
  List<Item> get listitems => _items;
  List<Item> get childitems =>
      _items.where((item) => item.targetAge == "child").toList();
  List<Item> get adultitems =>
      _items.where((item) => item.targetAge == "adult").toList();

  set listitems(List<Item> val) {
    _items = val;
    notifyListeners();
  }

/*
  Future<List<Item>> fetchItems() async {
    final response = await http.get('https://meds.dev-state.com/json/');

    List res = jsonDecode(response.body);
    List<Item> dataAll = [];

    for (var i = 0; i < res.length; i++) {
      var item = Item.fromJson(res[i]);
      dataAll.add(item);
    }

    listitems = dataAll;
    return listitems;
  }
}
*/

//Get all Items
  Future<List<Item>> fetchItems() async {
    
    http.Response response = await http.get("https://meds.dev-state.com/json/");

    if (response.statusCode == 200) {
      var mapResponse = jsonDecode(response.body);
      List items = mapResponse.cast<Map<String, dynamic>>();
      List<Item> dataAll = items.map<Item>((json) {
        return Item.fromJson(json);
      }).toList();
      listitems = dataAll;
      return listitems;
    } else {
      throw Exception('Failed to load Todo from the Internet');
    }
  }


//Add a new Item
Future addAnItem(Item item) async {

  final response = await http.put('https://meds.dev-state.com/json/add', body: json.encode(item));
  if (response.statusCode == 200) {
    final responseBody = await json.decode(response.body);
    return SnackBar(content: Text(responseBody));
  } else {
    throw Exception('Failed to update the Item. Error: ${response.toString()}');
  }
}


//Delete the Item
Future deleteAnItem(int id) async {

  final response = await http.get('https://meds.dev-state.com/json/del?id=$id');
  if (response.statusCode == 200) {
    final responseBody = await json.decode(response.body);
  return SnackBar(content: Text(responseBody));
  } else {
    throw Exception('Failed to delete the Item');
  }
}
}
