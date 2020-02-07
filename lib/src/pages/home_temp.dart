import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _options = ["uno", "dos", "tres"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Components temp")),
        body: ListView(
          children: _createItemsCortas(),
        ));
  }

  List<Widget> _crearItems() {
    List<Widget> lists = new List<Widget>();

    for (String opt in _options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lists..add(tempWidget)..add(Divider());
    }

    return lists;
  }

  List<Widget> _createItemsCortas() {
    return _options.map((opt) {
      return Column(
        children: <Widget>[
          ListTile(
              title: Text(opt + '!'),
              subtitle: Text("Cualquier cosa"),
              leading: Icon(Icons.account_balance_wallet),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: _handleOnTap),
          Divider()
        ],
      );
    }).toList();
  }

  void _handleOnTap() {
    print(_options);
  }
}
