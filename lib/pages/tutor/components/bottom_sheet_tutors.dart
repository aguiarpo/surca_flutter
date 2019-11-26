import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_bootom_sheet.dart';
import 'package:flutter_app/database/connect.dart';
import 'package:flutter_app/models/tutor.dart';
import 'package:flutter_app/models/tutors_incidents.dart';

import '../../../user_login.dart';

List<Widget> showMyBottomSheet(Tutor tutor){
  return <Widget>[
    MyBottomSheet(
      title: "Nome: ",
      subtitle: tutor.name,
    ),
    Visibility(
      visible: LoginDatabase.levelsOfAccess != "USUARIO",
      child: MyBottomSheet(
        title: "CPF: ",
        subtitle: tutor.cpf,
      ),
    ),
    Visibility(
      visible: LoginDatabase.levelsOfAccess != "USUARIO",
      child: MyBottomSheet(
        title: "RG: ",
        subtitle: tutor.rg,
      ),
    ),
    MyBottomSheet(
      title: "Nome da mãe: ",
      subtitle: tutor.motherName,
    ),
    MyBottomSheet(
      title: "Estado: ",
      subtitle: tutor.state,
    ),
    MyBottomSheet(
      title: "Cidade: ",
      subtitle: tutor.city,
    ),
    MyBottomSheet(
      title: "Bairro: ",
      subtitle: tutor.neighborhood,
    ),
    MyBottomSheet(
      title: "Rua: ",
      subtitle: tutor.street,
    ),
    MyBottomSheet(
      title: "Número: ",
      subtitle: tutor.number.toString(),
    ),
    MyBottomSheet(
      title: "Complemento: ",
      subtitle: tutor.complements == null ? "" : tutor.complements,
    ),
    MyBottomSheet(
      title: "Profissão: ",
      subtitle: tutor.profession,
    ),
    Container(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text("Telefones: "),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(tutor.telephone1),
            ),
            Text(tutor.telephone2 == null ? "" : tutor.telephone2),
          ],
        ),
      ),
    ),
    Container(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text("Incidentes: "),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tutor.nameIncidents,
        ),
      ),
    ),
  ];
}