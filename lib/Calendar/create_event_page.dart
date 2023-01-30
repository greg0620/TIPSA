import 'package:flutter/material.dart';
import 'package:tipsa/Calendar/extention.dart';
import 'package:tipsa/defis.dart';
import 'package:tipsa/new_feed.dart';
import 'package:tipsa/outils.dart';
import '../social_page.dart';
import '../a_table_page.dart';
import 'package:calendar_view/calendar_view.dart';
import 'add_event_widget.dart';

class CreateEventPage extends StatefulWidget {
  final bool withDuration;

  const CreateEventPage({Key? key, this.withDuration = false})
      : super(key: key);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Créer un Evenement"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: AddEventWidget(
          onEventAdd: context.pop,
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