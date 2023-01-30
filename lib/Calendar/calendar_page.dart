import 'package:flutter/material.dart';
import 'package:tipsa/defis.dart';
import 'package:tipsa/new_feed.dart';
import 'package:tipsa/outils.dart';
import '../favorite_page.dart';
import '../social_page.dart';
import '../a_table_page.dart';
import 'DayView_page.dart';
import 'WeekView_page.dart';
import 'MonthView-page.dart';

void CalendarPage(){
  runApp(MyCalendarPage());
}
class MyCalendarPage extends StatefulWidget {
  @override
  _MyCalendarPageState createState() => _MyCalendarPageState();

}
class _MyCalendarPageState extends State<MyCalendarPage> {
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SocialPage()
              ),
            );
          },
          child: const Text('Deconexion'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:  Image.asset('assets/images/logo.png'),
        title: Text("Agenda: Choix "),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
        ],
      ),
      body: Center(
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:[
            TextButton(
              onPressed: () { Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyMonthViewPage(),
                ),
              );},
              style : TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.purple
              ) ,
              child:
              Text('Par Mois'),
              ),
            TextButton(
              onPressed: () {Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyWeekViewPage(),
                ),
              );},
              style : TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.purple
              ) ,
              child : Text('Par semaine '),
              ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => MyDayViewPage(),
                  ),
                );
              },
              style : TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.purple
              ) ,
              child : Text('Par Jour'),
            ),

          ],
        ),
      ),
      bottomNavigationBar: ButtonBar(
        children: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyNewFeedPage(),
                ),
              );
            },
            icon: const Icon(Icons.home),
            color:Colors.blue ,
          ),
          IconButton(
            icon: const Icon(Icons.fastfood),
            color:Colors.green ,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyATablePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.sports_cricket),
            color: Colors.deepOrange,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyDefisPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.view_agenda_outlined),
            color: Colors.purple ,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MyOutilsPage(),
                ),
              );
            },
          ),
        ],
        alignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}