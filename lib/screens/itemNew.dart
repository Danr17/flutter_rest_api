import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rest_api/models/block.dart';
import 'package:flutter_rest_api/models/item.dart';

class NewItem extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  List<String> _ageCategories = <String>['', 'child', 'adult'];
  String _ageCat = '';
  String targetAge = 'child';

  List<String> _openStates = <String>['', 'true', 'false'];
  String _isOpen = '';
  String openState = 'child';

  String name;
  int expopen;
  String comments;

  //Create the date picker for Expiration date
  final TextEditingController _controlerExp = new TextEditingController();
  final TextEditingController _controlerOpen = new TextEditingController();

  Future _chooseDate(BuildContext context, String initialDateString,
      TextEditingController controller) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 2010 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(2010),
        lastDate: new DateTime(2030));

    if (result == null) return;

    setState(() {
      controller.text = new DateFormat("dd-MM-yyy").format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat("dd-MM-yyy").parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

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
            child: ListView(
              children: <Widget>[
                //Element Name
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Product Title',
                      hintText: 'Example Name',
                    ),
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved: (value) => name = value),
                SizedBox(
                  height: 16,
                ),

                //Element Expiration date
                new Row(children: <Widget>[
                  new Expanded(
                      child: new TextFormField(
                    decoration: new InputDecoration(
                      //  icon: const Icon(Icons.calendar_today),
                      hintText: '20-06-2020',
                      labelText: 'Expiration date',
                    ),
                    controller: _controlerExp,
                    keyboardType: TextInputType.datetime,
                  )),
                  new IconButton(
                    icon: new Icon(Icons.more_horiz),
                    tooltip: 'Choose date',
                    onPressed: (() {
                      _chooseDate(context, _controlerExp.text, _controlerExp);
                    }),
                  )
                ]),

                //Element IsOpen
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Is it Open ?',
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _isOpen == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          value: _isOpen,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              openState = newValue;
                              _isOpen = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _openStates.map((String value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Please select a state';
                  },
                ),

                new Row(children: <Widget>[
                  new Expanded(
                      child: new TextFormField(
                    decoration: new InputDecoration(
                      //  icon: const Icon(Icons.calendar_today),
                      hintText: '27-09-2019',
                      labelText: 'Opened date',
                    ),
                    controller: _controlerOpen,
                    keyboardType: TextInputType.datetime,
                  )),
                  new IconButton(
                    icon: new Icon(Icons.more_horiz),
                    tooltip: 'Choose date',
                    onPressed: (() {
                      _chooseDate(context, _controlerOpen.text, _controlerOpen);
                    }),
                  )
                ]),

                //Element Opened date
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Expiration (in days) if open',
                      hintText: '60',
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Expiration (in days) is required' : null,
                    onSaved: (value) => expopen = int.parse(value)),

                //Element targetAge
                FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Age Category',
                        errorText: state.hasError ? state.errorText : null,
                      ),
                      isEmpty: _ageCat == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          value: _ageCat,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              targetAge = newValue;
                              _ageCat = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _ageCategories.map((String value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                  validator: (val) {
                    return val != '' ? null : 'Please select an age category';
                  },
                ),

                //Element Opened date
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Comments',
                      hintText: 'Anything you want to note down',
                    ),
                    onSaved: (value) => comments = value),

                RaisedButton(
                  splashColor: Colors.red,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      await productProvider.addItem(Item(
                          name: name,
                          expDate: _controlerExp.text,
                          expOpen: expopen,
                          comment: comments,
                          targetAge: targetAge,
                          isOpen: _isOpen.toLowerCase() == 'true',
                          opened: _controlerOpen.text));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add New Item',
                      style: TextStyle(color: Colors.white)),
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
