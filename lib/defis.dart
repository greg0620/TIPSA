import 'package:flutter/material.dart';
import 'favorite_page.dart';
import 'a_table_page.dart';
import 'new_feed.dart';
import 'outils.dart';
import 'social_page.dart';

void defisPage(){
  runApp(MyDefisPage());
}
class MyDefisPage extends StatefulWidget {
  @override
  _MyDefisPageState createState() => _MyDefisPageState();

}
class _MyDefisPageState extends State<MyDefisPage> {
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
          child: const Text('Deconnexion'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:  Image.asset('assets/images/logo.png'),
        title: Text("Défis"),
        backgroundColor: Colors.deepOrangeAccent,
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
        child: const Icon(Icons.bookmark_border),
        onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyFavoritePage(),
          ),
        );
        },
        backgroundColor: Colors.deepOrangeAccent,
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