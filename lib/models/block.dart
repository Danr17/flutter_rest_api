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

  Map<dynamic, dynamic> toJson(Item item) {
    var mapData = new Map();
    mapData["name"] = item.name;
    mapData["expdate"] = item.expDate;
    mapData["expopen"] = item.expOpen;
    mapData["comment"] = item.comment;
    mapData["targetage"] = item.targetAge;
    mapData["isopen"] = item.isOpen;
    mapData["opened"] = item.opened;
    return mapData;
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

    http.Response response = await http.get("http://10.0.2.2:8080/json/");

    if (response.statusCode == 200) {
      var mapResponse = jsonDecode(response.body);
      List items = mapResponse.cast<Map<String, dynamic>>();
      List<Item> dataAll = items.map<Item>((json) {
        return Item.fromJson(json);
      }).toList();
      listitems = dataAll;
      return listitems;
    } else {
      throw Exception('Failed to load from the Internet');
    }
  }


//Add a new Item
Future addItem(Item item) async {
  final _headers = {'Content-Type': 'application/json'};

  Map<dynamic, dynamic> mapData = toJson(item);
  String newjson = json.encode(mapData);

  final response = await http.post('http://10.0.2.2:8080/json/add', headers: _headers, body: newjson);
  if (response.statusCode == 200) {
  //  final responseBody = await json.decode(response.body);
    return SnackBar(content: Text(response.body));
  } else {
    throw Exception('Failed to update the Item. Error: ${response.toString()}');
  }
}


//Delete the Item
Future deleteItem(String id) async {

  final response = await http.get('http://10.0.2.2:8080/json/del?id=$id');
  if (response.statusCode == 200) {
    final responseBody = await json.decode(response.body);
  return SnackBar(content: Text(responseBody));
  } else {
    throw Exception('Failed to delete the Item');
  }
}
}
