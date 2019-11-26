import 'package:flutter/material.dart';
import 'package:flutter_app/database/connect.dart';
import 'package:flutter_app/pages/user/login.dart';

import '../colors.dart';
import 'show_message_snackbar.dart';

// ignore: must_be_immutable
class MyConfigButton extends StatelessWidget {
  final String text;
  final String navigation;
  final scaffoldKey;
  DatabaseConnect db = DatabaseConnect();
  BuildContext _context;

  MyConfigButton({Key key, this.text, this.navigation, this.scaffoldKey}) : super(key: key);

  void navigationEditUser(navigation) async {
    var response = await Navigator.pushNamed(_context, navigation);
    MySnackBar.message(response, scaffoldKey: scaffoldKey);
  }

  void onTap()async{
    if(text == "Sair"){
      await db.truncateIncidentsWithTutor();
      await db.truncateMedications();
      await db.truncateIncidents();
      await db.truncateUsers();
      await db.truncateTutor();
      await db.truncateAnimal();
      await db.truncateVets();
      await db.truncateAnimalMedications();
      await db.truncateUserLogin();
      Navigator.pushAndRemoveUntil(
          _context,
          MaterialPageRoute(
              builder: (context) => LoginPage()
          ),
          ModalRoute.withName("/login")
      );
    } else{
      navigationEditUser(navigation);
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10, bottom: 20),
          width: MediaQuery.of(context).size.width - 80,
          decoration: BoxDecoration(
            color:  ColorsUsed.terciaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(text, style: TextStyle(color: Colors.white),),
          ),
        ),
      );
  }
}
