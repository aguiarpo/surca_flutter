import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/animals/page_view_animals.dart';
import 'package:flutter_app/pages/incidents/page_view_incidents.dart';
import 'package:flutter_app/pages/medications/page_view_medications.dart';
import 'package:flutter_app/pages/page_view_persons.dart';

import 'package:flutter_app/icons/surca_icons.dart';

import '../globals_var.dart';
import 'package:flutter_app/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NavBar();
  }
}

class NavBar extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  var bloc = NavigationDrawerBloc();

  List<Widget> _kTabPages(){
    return [
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(80),
                child: Image.asset('images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  "Este sistema foi desenvolvido pela AMVALI em parceria com a prefeitura de Guaramirim para fins de registro de animais microchipados",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ),
      ),
      PageViewListMedications(),
      PageViewListAnimals(),
      PageViewListPersons(
        parentAction: _updateNavigationWithChild,
      ),
      PageViewListIncidents()
    ];
  }

  List<Tab> _kTabs(){
    return <Tab> [
      Tab(icon: Icon(Icons.home),),
      Tab(icon: Icon(Surca.vaccine)),
      Tab(icon: Icon(Surca.animal),),
      Tab(icon: Icon(Icons.person),),
      Tab(icon: Icon(Surca.alert),),
    ];
  }

  _updateNavigationWithChild(int navigation) {
    setState(() {
      bloc.updateNavigationPagePersons(navigation);
    });
  }

  @override
  void initState() {
    List<Widget> kTabPagesList = _kTabPages();
    _tabController = TabController(
      length: kTabPagesList.length,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        opacity: bloc.getCurrentNavigation == 0 ? 0 : 1,
        child: DraggableFab(
          child: FloatingActionButton(
            onPressed: () {
              switch(bloc.getCurrentNavigation){
                case 1:
                  Navigator.pushNamed(context, '/registerMedications');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/registerAnimals');
                  break;
                case 3:
                  switch(bloc.getCurrentNavigationPagePersons){
                    case 0:
                      Navigator.pushNamed(context, '/registerUser');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/registerTutors');
                      break;
                  }
                  break;
                case 4:
                  Navigator.pushNamed(context, '/registerIncidents');
                  break;

              }

            },
            child: Icon(Icons.add, color: Colors.white,),
            backgroundColor: Color(0xffAD4347),
          ),
      ), duration: Duration(milliseconds: 500),
    ),
      appBar: AppBar(
        elevation: bloc.getCurrentNavigation == 3 ? 0 : 1,
        title: Text("Registro de animais", style: TextStyle(color: ColorsUsed.greenDarkColor,
          fontFamily: 'Roboto', fontWeight: FontWeight.w400,),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.dehaze),
          color: ColorsUsed.greenDarkColor,
          onPressed: (){
            Navigator.pushNamed(context, "/config");
          },)
        ],
        backgroundColor: ColorsUsed.mainColor,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Material(
        color: ColorsUsed.mainColor,
        child: Builder(
          builder: (context) {
            return TabBar(
              indicatorColor: ColorsUsed.greenDarkColor,
              labelColor: ColorsUsed.greenDarkColor,
              unselectedLabelColor: ColorsUsed.secundaryColor,
              tabs: _kTabs(),
              onTap: (index){
                Scaffold.of(context).hideCurrentSnackBar();
                setState(() {
                  bloc.updateNavigation(index);
                });
              },
              controller: _tabController,
            );
          }
        ),
      ),
      body: StreamBuilder<Object>(
        stream: bloc.getNavigation,
        initialData: bloc.navigationProvider.currentNavigation,
        builder: (context, snapshot) {
          return TabBarView(
            children: _kTabPages(),
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
          );
        }
      ),
    );
  }
}


