import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/providers/menu_provider.dart';
import 'package:components/src/pages/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("componentes")), body: _list());
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    return data.map((item) {
      return Column(children: <Widget>[
        ListTile(
            title: Text(item["texto"]),
            leading: getIcon(item["icon"]),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {

              Navigator.pushNamed(context, item["ruta"]);
           /*   final route = MaterialPageRoute(
                builder: (context) => AlertPage()

              );
              Navigator.push(context, route);*/

            })
      ]);
    }).toList();
  }
}
