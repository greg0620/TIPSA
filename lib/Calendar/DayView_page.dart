import 'package:flutter/material.dart';
import 'package:tipsa/defis.dart';
import 'package:tipsa/new_feed.dart';
import 'package:tipsa/outils.dart';
import '../social_page.dart';
import '../a_table_page.dart';
import 'package:calendar_view/calendar_view.dart';


void dayViewPage(){
  runApp(MyDayViewPage());
}
class MyDayViewPage extends StatefulWidget {
  @override
  _MyDayViewPageState createState() => _MyDayViewPageState();

}
class _MyDayViewPageState extends State<MyDayViewPage> {
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
        automaticallyImplyLeading: true,
        title: Text("Agenda"),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body : DayView(
        controller: EventController(),
        eventTileBuilder: (date, events, boundry, start, end) {
          // Return your widget to display as event tile.
          return Container();
        },
        fullDayEventBuilder: (events, date) {
          // Return your widget to display full day event view.
          return Container();
        },
        showVerticalLine: true, // To display live time line in day view.
        showLiveTimeLineInAllDays: true, // To display live time line in all pages in day view.
        minDay: DateTime(2000),
        maxDay: DateTime(2050),
        initialDay: DateTime(2023),
        heightPerMinute: 1, // height occupied by 1 minute time span.
        eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
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