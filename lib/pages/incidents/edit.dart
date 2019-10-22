import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_scaffold_tabs.dart';
import 'package:flutter_app/pages/incidents/tabs/tab_page1.dart';

class EditIncidents extends StatefulWidget {
  @override
  _EditIncidentsState createState() => _EditIncidentsState();
}

class _EditIncidentsState extends State<EditIncidents> {

  var kIcons = <Widget>[
    TabPage1(),
  ];

  @override
  Widget build(BuildContext context) {
    return MyScaffoldTabs(
      kIcons: kIcons,
      title: "Editar",
    );
  }
}
