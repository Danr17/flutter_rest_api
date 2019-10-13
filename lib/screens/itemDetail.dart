import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api/models/item.dart';
import 'package:flutter_rest_api/models/block.dart';

class ItemDetail extends StatelessWidget {
  final Item itemDetailed;

  ItemDetail({@required this.itemDetailed});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<BlockItem>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${itemDetailed.name}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              //         await productProvider.removeProduct(product.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              //        Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyProduct(product: product,)));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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

              SizedBox(height: 20,),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Expiration date :",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                       ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Text(
                     "${itemDetailed.daysValid}",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blue.shade600,
                       ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    ///here apply logic, if isValid then write
                    ///it will expire in these number of days
                    ///or has expired by this number of days
                    child: Text(
                      "This will expire in:",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                       ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Text(
                     itemDetailed.expDate,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blue.shade600,
                       ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Text(
                "ExpOpen : ${itemDetailed.expOpen}",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "Comment : ${itemDetailed.comment}",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "TargetAge : ${itemDetailed.targetAge}",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "Isopen : ${itemDetailed.isOpen}",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "Opened : ${itemDetailed.opened}",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "Isvalid: ${itemDetailed.isValid}",
                style: TextStyle(fontSize: 14.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
            ]
            ),
        ),
      ),
    );
  }
}
