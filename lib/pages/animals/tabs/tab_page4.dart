import 'package:flutter/material.dart';
import 'package:flutter_app/components/dropdown_button.dart';
import 'package:flutter_app/components/my_text_field.dart';

class TabPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: Select(
                    list: [ "Incidente1", "Incidente2"],
                    padding: EdgeInsets.only(left: 10, right: 10),
                    border: BoxDecoration(
                      border: Border.all(color: Colors.grey,),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              MyTextField(
                icon: Icons.phone,
                hint: "Telefone",
              ),
              MyTextField(
                icon: Icons.phone,
                hint: "Telefone",
              ),
            ],
          ),
        ),
      ),
    );
  }
}