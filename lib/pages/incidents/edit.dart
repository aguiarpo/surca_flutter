import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_text_field.dart';
import 'package:flutter_app/icons/surca_icons.dart';

import '../../colors.dart';

class EditIncidents extends StatefulWidget {
  @override
  _EditIncidentsState createState() => _EditIncidentsState();
}

class _EditIncidentsState extends State<EditIncidents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsUsed.greenDarkColor, //change your color here
        ),
        title: Text("Editar", style: TextStyle(
          fontFamily: 'Roboto', fontWeight: FontWeight.w400,
          color: ColorsUsed.greenDarkColor,
        ),
        ),
        backgroundColor: ColorsUsed.mainColor,
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text("Incidente", style: TextStyle(fontSize: 20, color: ColorsUsed.secundaryColor),),
              ),
              MyTextField(
                icon: Surca.incident,
                hint: "Nome",
              ),
              Padding(
                padding: EdgeInsets.only(top : 30, left: 100, right: 100),
                child: MyButton(
                  text: "Editar",
                  onPress: (){Navigator.pop(context);},
                ),
              )
            ],
          )
      ),
    );
  }
}