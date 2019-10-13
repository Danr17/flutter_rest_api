import 'package:flutter/material.dart';
import 'package:flutter_rest_api/screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api/models/item.dart';
import 'package:flutter_rest_api/models/block.dart';

class ItemDetail extends StatelessWidget {
  final Item itemDetailed;

  ItemDetail({@required this.itemDetailed});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<BlockItem>(context);

    void confirm() {
      AlertDialog alertDialog = new AlertDialog(
        content: new Text("Are You sure want to delete '${itemDetailed.name}'"),
        actions: <Widget>[
          new RaisedButton(
            child: new Text(
              "OK DELETE!",
              style: new TextStyle(color: Colors.black),
            ),
            color: Colors.red,
            onPressed: () {
              //   await productProvider.removeProduct(product.id);
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen(),
              ));
            },
          ),
          new RaisedButton(
            child:
                new Text("CANCEL", style: new TextStyle(color: Colors.black)),
            color: Colors.green,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );

      showDialog(context: context, builder: (_) => alertDialog);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${itemDetailed.name}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => confirm(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 310,
          child: Card(
            color: Colors.blue.shade50,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      itemDetailed.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      itemDetailed.targetAge,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        itemDetailed.isValid
                            ? "The item expires in :"
                            : "The item has expired",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "Expiration date :",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      Text(
                        "Is it opened ? :",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "Has been opened at :",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "Expiration days once open :",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${itemDetailed.daysValid} days",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        itemDetailed.expDate,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      Text(
                        itemDetailed.isOpen ? "Yes" : "No",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        itemDetailed.opened,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        "${itemDetailed.expOpen}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue.shade600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Comments :",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      itemDetailed.comment,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
