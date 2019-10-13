import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api/models/block.dart';
import 'package:flutter_rest_api/models/item.dart';

class newItem extends StatefulWidget {
  @override
  _newItemState createState() => _newItemState();
}

class _newItemState extends State<newItem> {
  final _formKey = GlobalKey<FormState>();
  String productType = 'false';
  String targetAge = 'child';
  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<BlockItem>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Product'),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
              child: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //Element Name
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Product Title',
                      hintText: 'Example Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Product Name';
                      }
                    },
                    onSaved: (value) => title = value),
                SizedBox(
                  height: 16,
                ),

                //Element Expiration date
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Expiration date',
                      hintText: '20-06-2020',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the Expiration date';
                      }
                    },
                    onSaved: (value) => price = value),

                //Element IsOpen
                DropdownButton<String>(
                  hint: Text("yes or no"),
                  value: productType,
                  isExpanded: true,
                  onChanged: (String newValue) {
                    setState(() {
                      productType = newValue;
                    });
                  },
                  items: <String>['true', 'false']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                //Element Opened date
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Opened date',
                      hintText: '27-09-2019',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the Opened date';
                      }
                    },
                    onSaved: (value) => price = value),

                //Element Opened date
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Expiration (in days) if open',
                      hintText: '60',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the Expiration in days if open';
                      }
                    },
                    onSaved: (value) => price = value),

                //Element targetAge
                DropdownButton<String>(
                  value: targetAge,
                  isExpanded: true,
                  onChanged: (String newValue) {
                    setState(() {
                      targetAge = newValue;
                    });
                  },
                  items: <String>['child', 'adult']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                //Element Opened date
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Comments',
                      hintText: 'Anything you want to note down',
                    ),
                    onSaved: (value) => price = value),

                RaisedButton(
                  splashColor: Colors.red,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      //     await productProvider.addItem(Item(name: title,price: price,img: productType.toLowerCase()));
                      Navigator.pop(context);
                    }
                  },
                  child:
                      Text('Add New Item', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
